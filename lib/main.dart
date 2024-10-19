import 'package:flutter/material.dart';
import 'package:food_delivry/first.dart';
import 'package:food_delivry/second.dart';
import 'package:food_delivry/third.dart';
void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  routes: {
    '/':(context)=>const auth(),
    '/home':(context)=>const homepage(),
    '/detailview':(context)=>const ImageGalleryPage(),
  },
));