// ignore_for_file: prefer_const_constructors, deprecated_member_use, depend_on_referenced_packages, use_super_parameters, camel_case_types, prefer_const_declarations

import 'package:check/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Authservice/shared/loading.dart';

class deliveryRoute extends StatefulWidget {
  const deliveryRoute({Key? key}) : super(key: key);

  @override
  State<deliveryRoute> createState() => _deliveryRoutestate();
}

class _deliveryRoutestate extends State<deliveryRoute> {
  List<LatLng> routePoints = []; // List to hold the route's polyline points
  LatLng? currentLocation;
  String time = "";
  String distance = "";

  @override
  void initState() {
    super.initState();
    _fetchCurrentLocationAndRoute(); // Fetch the current location and route when the app initializes
  }

  // Fetch the current location and route data from OSRM
  Future<void> _fetchCurrentLocationAndRoute() async {
    final startLatLng = const LatLng(9.00137, 38.765821); // Start location

    // Get the current location
    Position position = await _getCurrentLocation();
    final endLatLng =
        LatLng(position.latitude, position.longitude); // End location

    // OSRM API for getting the route (driving profile)
    final url =
        'http://router.project-osrm.org/route/v1/driving/${startLatLng.longitude},${startLatLng.latitude};${endLatLng.longitude},${endLatLng.latitude}?overview=full';

    final response = await http.get(Uri.parse(url)); // Make the HTTP request

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final encodedPolyline =
          data['routes'][0]['geometry']; // Get encoded polyline

      // Decode the polyline into a list of LatLng points
      setState(() {
        routePoints = decodePolyline(encodedPolyline);
        currentLocation = endLatLng; // Set the current location
        time = data['routes'][0]['duration'].toString();
        distance = data['routes'][0]['distance'].toString();
      });
    } 
  }

  // Get the current location using geolocator
  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can continue
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  // Use flutter_polyline_points to decode the polyline
  List<LatLng> decodePolyline(String encoded) {
    PolylinePoints polylinePoints = PolylinePoints();
    List<PointLatLng> result = polylinePoints.decodePolyline(encoded);

    // Convert PointLatLng to LatLng
    return result
        .map((point) => LatLng(point.latitude, point.longitude))
        .toList();
  }

  @override
  Widget build(BuildContext context) {

    return currentLocation == null
        ? Loading()
        : Scaffold(
          appBar: AppBar(
            title: Text("$time ${distance}m"),
            centerTitle: true,
          ),
            body: FlutterMap(
              options: MapOptions(
                initialCenter: currentLocation ??
                    LatLng(8.5769,
                        39.2906), // Center the map on the current location if available
                initialZoom: 14, // Initial zoom level
              ),
              children: [
                _buildTileLayer(), // Map tiles layer
                if (routePoints.isNotEmpty) _buildPolylineLayer(),
                // Polyline layer for the route
                MarkerLayer(
                  markers: [
                    Marker(
                      point: currentLocation!,
                      width: 100,
                      height: 100,
                      child: const Icon(
                        Icons.person,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                    const Marker(
                      point: LatLng(9.00137, 38.765821),
                      width: 100,
                      height: 100,
                      child: Icon(
                        Icons.food_bank_outlined,
                        color: Color.fromARGB(255, 255, 18, 2),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            bottomNavigationBar: ButtonNavBar3(),

          )
          
          
          ;
  }

  // Function to create the map tile layer
  TileLayer _buildTileLayer() {
    return TileLayer(
      urlTemplate:
          "https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}",
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );
  }

  // Function to create the polyline layer
  PolylineLayer _buildPolylineLayer() {
    return PolylineLayer(
      polylines: [
        Polyline(
          points: routePoints, // The decoded polyline points
          strokeWidth: 5.0, // Line thickness
          color: Colors.blueAccent, // Line color
        ),
      ],
    );
  }
}
