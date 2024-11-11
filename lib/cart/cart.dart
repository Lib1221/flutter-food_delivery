// ignore_for_file: avoid_types_as_parameter_names

import 'package:check/payment/pay.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Carts extends StatefulWidget {
  const Carts({super.key});

  @override
  State<Carts> createState() => _CartsState();
}

class _CartsState extends State<Carts> {
  final CollectionReference cart =
      FirebaseFirestore.instance.collection('cart');
  void incrementCounter(String docId) {
    cart.doc(docId).update({
      'Amount': FieldValue.increment(1),
    });
  }

  
  void removeCard(String docId) {
    cart.doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
        elevation: 10,
        backgroundColor: Colors.orange.shade400,


      ),
      body: Container(
    decoration: BoxDecoration(
    gradient: LinearGradient(
    colors: [
    Colors.orange.shade100,
    Colors.orange.shade200,
    Colors.orange.shade300
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    ),
    ),
      child:StreamBuilder<QuerySnapshot>(
        stream: cart.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          // Filter documents where Amount > 0
          final filteredDocs =
              snapshot.data!.docs.where((doc) => doc['Amount'] > 0).toList();

          if (filteredDocs.isEmpty) {
            return const Center(child: Text("No items in cart"));
          }

          // Calculate total amount
          double totalAmount = filteredDocs.fold(
              0, (sum, doc) => sum + (doc['Price'] * doc['Amount']));

          return Column(
            children: [
              Expanded(
                child: ListView(
                  children: filteredDocs.map((doc) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(
                            color: Colors.redAccent, width: 1.5),
                      ),
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
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
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  margin: const EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      
                                        Text(
                                          doc['Name'],
                                          style: const TextStyle(
                                            color: Colors.black87,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          
                                        ),
                                      ),
                                      Text(
                                        '\$${doc['Price'].toString()}',
                                        style: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Center(
                                  child: Text(doc['Amount'].toString(),
                                      style: const TextStyle(
                                          color: Colors.black54,
                                          fontSize: 18))),
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      incrementCounter(doc.id);
                                    },
                                    iconSize: 40,
                                    icon: const Icon(Icons.add,
                                        color: Colors.black),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      removeCard(doc.id);
                                    },
                                    iconSize: 40,
                                    icon: const Icon(Icons.delete_forever,
                                        color:
                                            Color.fromARGB(255, 251, 0, 0)),
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
                padding: const EdgeInsets.all(16.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total Amount:",
                          style: TextStyle(fontSize: 20)),
                      Text("\$${totalAmount.toStringAsFixed(2)}",
                          style: const TextStyle(fontSize: 20)),

                      TextButton(onPressed: (){
                        Stripeservice.instance.makePayment(totalAmount.round());

                      }, child: const Text("Order Now"))
                    ]),
              )
            ],
          );
        },
      ),
    ),);
  }
}
