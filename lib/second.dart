import 'package:flutter/material.dart';
import 'package:food_delivry/container.dart';
import 'package:food_delivry/common.dart';
import 'package:lottie/lottie.dart';
// ignore: camel_case_types
class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

// ignore: camel_case_types
class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    bool pizza = false;

    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        backgroundColor: Colors.redAccent,
        title: const Text('MesobXpress',
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white)),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.arrow_circle_right,
            size: 50,
            color: Colors.cyan,
            ),
          )
        ],
        ),
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
              color:Colors.deepPurple,
                child: Center(
        child: Lottie.network(
          'https://lottie.host/43306f5c-eff3-49e9-a639-741b8152486e/tda8AOEQ70.json',
        // Optional: Set a custom height
          fit: BoxFit.fill, // Optional: Adjust the fit
        ),
      ),
              )),
          Expanded(
              flex: 8,
              child: Container(
                color: Color(0xFFFFF8E7),
                child: const Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 30,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              navbar(),
                              navbar(),
                              navbar(),
                              navbar(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 9,
                        child: MyWidget(),
                        )
                  ],
                ),
              )),
          bottommenu()
        ],
      ),
    );
  }
}
