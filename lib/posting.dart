// ignore_for_file: must_be_immutable, prefer_const_constructors, non_constant_identifier_names, override_on_non_overriding_member, use_build_context_synchronously

import 'dart:typed_data';
import 'package:check/Authservice/shared/loading.dart';
import 'package:check/Authservice/welcome/constants.dart';
import 'package:check/a.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart'; // Import file_picker package
import 'package:flutter/material.dart';

class InputTaker extends StatefulWidget {
  InputTaker({super.key});
  bool loading = false;

  @override
  State<InputTaker> createState() => _InputTakerState();
}

class _InputTakerState extends State<InputTaker> {
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;
  double uploadProgress = 0.0; // To track upload progress
  String? imageAddress;

  void uploadFile() async {
    // Use File Picker to select an image
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      // Get the selected file as bytes
      Uint8List bytes = result.files.first.bytes!;
      String fileName = result.files.first.name;

      try {
        String url = await uploadToCloudinary(bytes, fileName);
        setState(() {
          imageAddress = url; // Update the image URL to display it
        });
      } catch (error) {
        setState(() {
          this.error = 'Failed to upload image: $error'; // Set error message
        });
      }
    } else {
      // User canceled the picker
    }
  }

  Future<String> uploadToCloudinary(Uint8List imageBytes, String fileName) async {
    const cloudName = 'dkiuz3gfn'; // Replace with your Cloudinary cloud name
    const uploadPreset = 'public';

    final dio = Dio();
    final formData = FormData.fromMap({
      'file': MultipartFile.fromBytes(imageBytes, filename: fileName),
      'upload_preset': uploadPreset,
    });

    try {
      final response = await dio.post(
        'https://api.cloudinary.com/v1_1/$cloudName/image/upload',
        data: formData,
        onSendProgress: (sent, total) {
          setState(() {
            uploadProgress = sent / total; // Calculate progress percentage
          });
        },
      );

      if (response.statusCode == 200) {
        return response.data['secure_url']; // Return the image URL
      } else {
        throw Exception('Failed to upload image');
      }
    } catch (e) {
      throw Exception('Failed to upload image');
    }
  }

  String price = "";
  String amount = "";
  String name = '';
  String? selectedValue;
  List<String> options = [
    "softDrinkBank",
    "pizzaThingBank",
    "pastaThingBank",
    "shiroNegarBank"
  ];

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Choose an option',
                      border: OutlineInputBorder(),
                    ),
                    value: selectedValue,
                    items: options.map((String option) {
                      return DropdownMenuItem<String>(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue;
                      });
                    },
                    validator: (value) => value == null ? 'Please select an option' : null,
                  ),
                  ElevatedButton(onPressed: uploadFile, child: Text("Upload Image")),
                  if (uploadProgress > 0) CircularProgressIndicator(value: uploadProgress),
                  SizedBox(height: defaultPadding),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    cursorColor: kPrimaryColor,
                    decoration: const InputDecoration(
                      hintText: "Your Name",
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(defaultPadding),
                        child: Icon(Icons.person),
                      ),
                    ),
                    validator: (val) => val!.isEmpty ? 'Enter Name' : null,
                    onChanged: (val) => setState(() => name = val),
                  ),
                  SizedBox(height: defaultPadding / 2),
                  TextFormField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    textInputAction: TextInputAction.next,
                    cursorColor: kPrimaryColor,
                    decoration: const InputDecoration(
                      hintText: "Price",
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(defaultPadding),
                        child: Icon(Icons.attach_money),
                      ),
                    ),
                    validator: (val) => val!.isEmpty ? 'Enter Price' : null,
                    onChanged: (val) => setState(() => price = val),
                  ),
                  SizedBox(height: defaultPadding / 2),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    cursorColor: kPrimaryColor,
                    decoration: const InputDecoration(
                      hintText: "Amount",
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(defaultPadding),
                        child: Icon(Icons.add_shopping_cart),
                      ),
                    ),
                    validator: (val) => val!.isEmpty ? 'Enter Amount' : null,
                    onChanged: (val) => setState(() => amount = val),
                  ),
                  SizedBox(height: defaultPadding / 2),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() => loading = true);
                        if (imageAddress != null && selectedValue != null) {
                          CollectionReference newFileAdded =
                              FirebaseFirestore.instance.collection(selectedValue!);
                          List<Cart_instances> adding = [
                            Cart_instances(
                              Name:name,
                              Price:int.parse(price),
                              ImageAddress:imageAddress!,
                              Amount:int.parse(amount)
                            )
                          ];
                          await newFileAdded.add(adding[0].toJson());
                          setState(() => loading = false);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
                            Text('Upload successful!')));
                        } else {
                          setState(() => loading = false);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
                            Text('Image address is empty.')));
                        }
                      }
                    },
                    child:
                        Text("UPLOAD".toUpperCase()),
                  ),
                  Text(
                    error,
                    style:
                        const TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                ],
              ),
            ),
          );
  }
}