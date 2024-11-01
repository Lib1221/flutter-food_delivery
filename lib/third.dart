// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';


class ImageGalleryPage extends StatefulWidget {
  const ImageGalleryPage({super.key});

  @override
  _ImageGalleryPageState createState() => _ImageGalleryPageState();
}

class _ImageGalleryPageState extends State<ImageGalleryPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> _images = [
    'assets/a.jpg', // Add your image assets here
    'assets/b.jpg',
    'assets/c.jpg',
  ];

  void _goToNextPage() {
    if (_currentPage < _images.length - 1) {
      setState(() {
        _currentPage++;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Gallery'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: PageView.builder(
              controller: _pageController,
              itemCount: _images.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return Image.asset(_images[index], fit: BoxFit.cover,scale: 2,);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: _goToPreviousPage,
                  disabledColor: Colors.grey, // Disables the button if no more pages
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: _goToNextPage,
                  disabledColor: Colors.grey,
                ),
              ],
            ),
          ),

          Expanded(
            flex: 2,
            child: Container(
  
              color: Colors.blue,

              child: const Column(
                children: [
                  Text("abcdefghij klmn opqrst uvwxyz abcdefghij klmn opqrst uvwxyz abcdefghij klmn opqrst uvwxyz abcdefghij klmn opqrst uvwxyz abcdefghij klmn opqrst uvwxyz ",
                  
                  style: TextStyle(
                    overflow: TextOverflow.visible,
                  ),
                  ),
                  Text("price value"),
                  Text("an Icon if you want to add to chart")
                ],
              ),
            ),
            
            )
          ,
      
                  ],


      ),
    
    
  
    
    );
  }
}
