// ignore_for_file: use_super_parameters, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:check/backend.dart';

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