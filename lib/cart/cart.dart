import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Carts extends StatefulWidget {
  const Carts({super.key});

  @override
  State<Carts> createState() => _CartsState();
}

class _CartsState extends State<Carts> {
  final CollectionReference _db =
      FirebaseFirestore.instance.collection('pizzaThingBank');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: _db.snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
              
            // Filter documents where Amount > 0
            final filteredDocs = snapshot.data!.docs.where((doc) => doc['Amount'] > 0).toList();
              
            if (filteredDocs.isEmpty) {
              return const Center(child: Text("No items in cart"));
            }
              
            // Calculate total amount
            double totalAmount = filteredDocs.fold(0, (sum, doc) => sum + (doc['Price'] * doc['Amount']));
              
            return Column(
              children: [
                Expanded(
                  child: ListView(
                    children: filteredDocs.map((doc) {
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
                                    doc["ImageAddress"],
                                    fit: BoxFit.cover,
                                    height: 120,
                                    width: 100,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                    margin: const EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pushNamed(context, '/detailview');
                                          },
                                          child: Text(
                                            doc['Name'],
                                            style: const TextStyle(
                                              color: Colors.black87,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '\$${doc['Price'].toString()}',
                                          style:
                                              const TextStyle(color: Colors.black54, fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Center(child:
                                    Text(doc['Amount'].toString(), style:
                                    const TextStyle(color:
                                    Colors.black54, fontSize:
                                    18))),
                                Column(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        // Increment logic here
                                      },
                                      iconSize: 40,
                                      icon:
                                          const Icon(Icons.add_box_outlined, color:
                                          Colors.black),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        // Reset logic here
                                      },
                                      iconSize: 40,
                                      icon:
                                          const Icon(Icons.restart_alt_outlined, color:
                                          Colors.black),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.all(16.0),
                  child:
                      Row(mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                          children:[
                            const Text("Total Amount:",
                                style:
                                TextStyle(fontSize:
                                20)),
                            Text("\$${totalAmount.toStringAsFixed(2)}",
                                style:
                                const TextStyle(fontSize:
                                20)),
                          ]),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}