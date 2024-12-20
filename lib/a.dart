// ignore_for_file: use_super_parameters, non_constant_identifier_names, camel_case_types, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

List nav_items = [
  "softDrinkBank",
  "pizzaThingBank",
  "pastaThingBank",
  "shiroNegarBank"
];

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
  CollectionReference _db = FirebaseFirestore.instance.collection(nav_items[0]);
  CollectionReference cart = FirebaseFirestore.instance.collection('cart');

// Function to get the document ID from the cart based on item name

  Future<void> getCartItemIdByName(String itemName, int new_amount) async {
    try {
      QuerySnapshot cartSnapshot = await FirebaseFirestore.instance
          .collection('cart')
          .where('Name', isEqualTo: itemName)
          .get();

      if (cartSnapshot.docs.isNotEmpty) {
        cart.doc(cartSnapshot.docs.first.id).update({
          'Amount': new_amount,
        });
      }
    } catch (e) {
      print("$e");
    }
  }

  Future<void> removeCardByName(String itemName) async {
    try {
      QuerySnapshot cartSnapshot = await FirebaseFirestore.instance
          .collection('cart')
          .where('Name', isEqualTo: itemName)
          .get();

      if (cartSnapshot.docs.isNotEmpty) {
        cart.doc(cartSnapshot.docs.first.id).delete();
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<bool> addCardByName(String itemName) async {
    try {
      QuerySnapshot cartSnapshot = await FirebaseFirestore.instance
          .collection('cart')
          .where('Name', isEqualTo: itemName)
          .get();

      if (cartSnapshot.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  void _incrementCounter(String docId) {
    _db.doc(docId).update({
      'Amount': FieldValue.increment(1),
    });
  }

  void remove_cart(String docId) {
    cart.doc(docId).delete();
  }

  void updateValueToZero(String docId) {
    _db.doc(docId).update({'Amount': 0});
  }

  // Function to change the selected value
  void value_changer(int num) {
    setState(() {
      selector_item = num;
      _db = FirebaseFirestore.instance.collection(nav_items[num]);
    });
  }

  Future Adding_cart() async {}
  int Number = 0;
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
    return Expanded(
      flex: 8,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 87, 34), // ARGB color for start (e.g., orange)
              Color.fromARGB(255, 33, 150, 243), // ARGB color for end (e.g., blue)
            ],
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
              child: StreamBuilder<QuerySnapshot?>(
                stream: _db.snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ListView(
                    children: snapshot.data!.docs.map((doc) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(
                            color: Color(0xFFBDBDBD), // Light Grey Border
                            width: 1.5,
                          ),
                        ),
                        elevation: 5, // Moderate elevation
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        color: const Color(0xFFFFFFFF), // White Background for the card
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: SizedBox(
                            height: 120,
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    doc["ImageAddress"], // Use data from Firestore
                                    fit: BoxFit.cover,
                                    height: 120,
                                    width: 100,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                    margin: const EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white, // Inner container color
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            doc['Name'], // Use data from Firestore
                                            style: const TextStyle(
                                              color: Color(0xFF424242), // Dark Grey for text
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '\$${doc['Price'].toString()}', // Use data from Firestore
                                          style: const TextStyle(
                                            color: Color(0xFF757575), // Grey for price text
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: Text(
                                      doc['Amount'].toString(), // Use data from Firestore
                                      style: const TextStyle(color: Color(0xFF757575), fontSize: 18), // Grey for amount text
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                      onPressed: () async {
                                        if (await addCardByName(doc['Name'])) {
                                          getCartItemIdByName(doc['Name'], doc['Amount'] + 1);
                                        } else {
                                          List<Cart_instances> adding = [
                                            Cart_instances(
                                                Name: doc['Name'],
                                                Price: doc['Price'],
                                                ImageAddress:
                                                doc['ImageAddress'],
                                                Amount:
                                                doc['Amount'] + 1)
                                          ];
                                          cart.add(adding[0].toJson());
                                        }

                                        _incrementCounter(doc.id);
                                      },
                                      iconSize: 40,
                                      icon:
                                      const Icon(Icons.add_box_outlined, color: Colors.black),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        updateValueToZero(doc.id);
                                        removeCardByName(doc['Name']);
                                      },
                                      iconSize: 40,
                                      icon:
                                      const Icon(Icons.restart_alt_outlined, color: Colors.black),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
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
          margin: const EdgeInsets.symmetric(
              horizontal: 5.0), // Space between buttons
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: isActive ? Colors.amberAccent : Colors.white),
          child: Center(
              child: Text(
            title,
            style: TextStyle(
                color: isActive ? Colors.white : Colors.black54,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal),
          )),
        ),
      ),
    );
  }
}

class Cart_instances {
  String Name;
  int Price;
  String ImageAddress;
  int Amount;
  Cart_instances(
      {required this.Name,
      required this.Price,
      required this.ImageAddress,
      required this.Amount});
  toJson() {
    return {
      "Name": Name,
      "Price": Price,
      "ImageAddress": ImageAddress,
      "Amount": Amount
    };
  }
}
