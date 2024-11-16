// ignore_for_file: use_super_parameters

import 'package:check/Authservice/shared/loading.dart';
import 'package:check/posting.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

String? getCurrentUserId() {
  User? user = FirebaseAuth.instance.currentUser; // Get the current user
  return user?.uid; // Return the user ID if signed in, otherwise null
}

Future<bool> isAdmin() async {
  String? userId = getCurrentUserId();
  if (userId == null) return false; // If no user is signed in, return false

  // Query Firestore to check if the user is an admin
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('admin')
      .where('name', isEqualTo: userId) // Assuming you store UID in Firestore
      .get();

  return querySnapshot.docs.isNotEmpty; // Return true if admin exists
}

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool loading = true;
  bool? isAdminUser;

  @override
  void initState() {
    super.initState();
    checkIfAdmin(); // Check if the current user is an admin on initialization
  }

  Future<void> checkIfAdmin() async {
    bool result = await isAdmin();
    setState(() {
      isAdminUser = result;
      loading = false; // Stop loading once the check is complete
    });
  }





  
  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Loading(); // Show loading indicator while fetching data
    }

    return isAdminUser == true
        ? Scaffold(
          appBar: AppBar(
            title: Text("Amin Page"),
            centerTitle: true,
          ),
            body: InputTaker(),
          )
        : 
        
        
        Scaffold(
            appBar: AppBar(
              title: Text("hey customer"),
            ),
          );
  }
}
