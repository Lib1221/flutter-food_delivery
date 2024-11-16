<<<<<<< HEAD
// ignore_for_file: use_super_parameters, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:check/backend.dart';
=======
// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:food_delivry/backend.dart';
>>>>>>> 531ceb1893ed0a4ad86901d9c7e15b3d9352732a

int selector_item = 0;
bool softdrinktrue = true;
bool pizzatrue = false;
bool pastatrue = false;
bool shirotrue = false;

class A extends StatefulWidget {
  const A({super.key});

  @override
  State<A> createState() => _AState();
}

class _AState extends State<A> {
<<<<<<< HEAD
  // Function to change the selected value
  void value_changer(int num) {
    setState(() {
      selector_item = num; // Update the selector item
    });
  }

  // Function to change the navbar color based on selection
  void navbar_chnager_color(int num) {
    setState(() {
      softdrinktrue = num == 0;
      pizzatrue = num == 1;
      pastatrue = num == 2;
      shirotrue = num == 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    List nav_items = [softDrinkBank, pizzaThingBank, pastaBank, shiroNegarBank];

    return Expanded(
      flex: 8,
      child: Container(
        decoration: BoxDecoration(

          gradient: LinearGradient(
            colors: [Colors.orange.shade100, Colors.orange.shade200, Colors.orange.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FoodSelectionRow(
                  softDrinkTrue: softdrinktrue,
                  pizzaTrue: pizzatrue,
                  pastaTrue: pastatrue,
                  shiroTrue: shirotrue,
                  valueChanger: value_changer,
                  navbarChangerColor: navbar_chnager_color,
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: ListView.builder(
                itemCount: nav_items[selector_item].length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: const BorderSide(color: Colors.redAccent, width: 1.5),
                    ),
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    color: const Color(0xFFFFF8E7),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        height: 120,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                nav_items[selector_item][index].ImageAddress,
                                fit: BoxFit.cover,
                                height: 120,
                                width: 100,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                margin: const EdgeInsets.only(left: 10),
                                decoration:
                                    BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/detailview');
                                      },
                                      child: Text(
                                        nav_items[selector_item][index].Name,
                                        style:
                                            const TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      '\$${nav_items[selector_item][index].Price.toString()}',
                                      style:
                                          const TextStyle(color: Colors.black54, fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              iconSize: 40,
                              icon:
                                  const Icon(Icons.add_box_outlined, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FoodSelectionRow extends StatelessWidget {
  final bool softDrinkTrue;
  final bool pizzaTrue;
  final bool pastaTrue;
  final bool shiroTrue;
  final Function(int) valueChanger;
  final Function(int) navbarChangerColor;

  const FoodSelectionRow({
    Key? key,
    required this.softDrinkTrue,
    required this.pizzaTrue,
    required this.pastaTrue,
    required this.shiroTrue,
    required this.valueChanger,
    required this.navbarChangerColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButton("Soft Drink", softDrinkTrue, 0),
        _buildButton("Pizza", pizzaTrue, 1),
        _buildButton("Pasta", pastaTrue, 2),
        _buildButton("Shiro", shiroTrue, 3),
      ],
    );
  }

  Widget _buildButton(String title, bool isActive, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          valueChanger(index);
          navbarChangerColor(index);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5.0), // Space between buttons
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(20), color:isActive ? Colors.amberAccent : Colors.white),
          child:
              Center(child:
              Text(title, style:
              TextStyle(color:isActive ? Colors.white : Colors.black54,fontWeight:isActive ? FontWeight.bold : FontWeight.normal),)),
        ),
      ),
    );
  }
}
=======
  @override
  Widget build(BuildContext context) {
    List nav_items = [softDrinkBank, pizzaThingBank, pastaBank, shiroNegarBank];
    value_changer(int num) {
      selector_item = num;
    }

    navbar_chnager_color(int num) {
      softdrinktrue = num == 0 ? true : false;
      pizzatrue = num == 1 ? true : false;
      pastatrue = num == 2 ? true : false;
      shirotrue = num == 3 ? true : false;
    }

    return Expanded(
        flex: 8,
        child: Container(
          color: const Color(0xFFFFF8E7),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(174, 255, 248, 231),
                                borderRadius: BorderRadius.circular(20)),
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  
                                    backgroundColor:
                                        WidgetStatePropertyAll(softdrinktrue
                                            ? Colors.amberAccent
                                            // ignore: dead_code
                                            : null),
                                    elevation: WidgetStatePropertyAll(
                                        // ignore: dead_code
                                        softdrinktrue ? 10 : 1)),
                                onPressed: () {
                                  setState(() {
                                    value_changer(0);
                                    navbar_chnager_color(0);
                                  });
                                },
                                child: const Text("SoftDrink")),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStatePropertyAll(pizzatrue
                                            ? Colors.amberAccent
                                            // ignore: dead_code
                                            : null),
                                    elevation: WidgetStatePropertyAll(
                                        // ignore: dead_code
                                        pizzatrue ? 10 : 1)),
                                    onPressed: () {
                                      setState(() {
                                        value_changer(1);
                                        navbar_chnager_color(1);
                                      });
                                    },
                                    child: const Text("pizza"))),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStatePropertyAll(pastatrue
                                            ? Colors.amberAccent
                                            // ignore: dead_code
                                            : null),
                                    elevation: WidgetStatePropertyAll(
                                        // ignore: dead_code
                                        pastatrue ? 10 : 1)),
                                    onPressed: () {
                                      setState(() {
                                        value_changer(2);
                                        navbar_chnager_color(2);
                                      });
                                    },
                                    child: const Text("pasta"))),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStatePropertyAll(shirotrue
                                            ? Colors.amberAccent
                                            // ignore: dead_code
                                            : null),
                                    elevation: WidgetStatePropertyAll(
                                        // ignore: dead_code
                                        shirotrue ? 10 : 1)),
                                    onPressed: () {
                                      setState(() {
                                        value_changer(3);
                                        navbar_chnager_color(3);
                                      });
                                    },
                                    child: const Text("Shiro"))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: ListView.builder(
                  itemCount: nav_items[selector_item].length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            12), // Rounded corners for a modern look
                        side: const BorderSide(
                          color: Colors.redAccent, // Border color: Tomato Red
                          width: 2, // Border width: 2 for more visibility
                        ),
                      ),
                      color: const Color(0xFFFFF8E7),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.all(10),
                        child: SizedBox(
                          height: 100,
                          child: Row(
                            children: [
                              Image.asset(
                                nav_items[selector_item][index].ImageAddress,
                                fit: BoxFit.cover,
                                height: 100,
                              ),
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 15),
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xFFFFDAB9),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 7,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pushNamed(
                                                      context, '/detailview');
                                                },
                                                child: Text(
                                                  nav_items[selector_item]
                                                          [index]
                                                      .Name,
                                                  style: const TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 23,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                nav_items[selector_item][index]
                                                    .Price
                                                    .toString(),
                                                style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: IconButton(
                                                onPressed: () {},
                                                hoverColor: Colors.grey,
                                                icon: const Icon(
                                                  Icons.add_box_outlined,
                                                  size: 40,
                                                  color: Colors.black,
                                                )))
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
>>>>>>> 531ceb1893ed0a4ad86901d9c7e15b3d9352732a
