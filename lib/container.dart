// ignore_for_file: non_constant_identifier_names, camel_case_types
import 'package:flutter/material.dart';
int selector_item = 1;
class softDrink {
  String Name;
  int Price;
  String ImageAddress;
  softDrink(
      {required this.Name, required this.Price, required this.ImageAddress});
}

class Pasta {
  String Name;
  int Price;
  String ImageAddress;

  Pasta({required this.Name, required this.Price, required this.ImageAddress});
}

class PizzaThing {
  String Name;
  int Price;
  String ImageAddress;
  PizzaThing(
      {required this.Name, required this.Price, required this.ImageAddress});
}

class ShiroNegar {
  String Name;
  int Price;
  String ImageAddress;
  ShiroNegar(
      {required this.Name, required this.Price, required this.ImageAddress});
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
  
  void index_taker(int num) {
    selector_item = num;
  }
}

class _MyWidgetState extends State<MyWidget> {


  @override
  Widget build(BuildContext context) {
    List<softDrink> softDrinkBank = [
      softDrink(Name: 'coca-cola', Price: 60, ImageAddress: 'assets/coca.png'),
      softDrink(Name: 'fanta', Price: 60, ImageAddress: 'assets/fanta.png'),
      softDrink(Name: 'pepsi', Price: 60, ImageAddress: 'assets/pepsi.png'),
      softDrink(Name: 'sprite', Price: 60, ImageAddress: 'assets/sprite.png'),
      softDrink(Name: 'Water', Price: 30, ImageAddress: 'assets/water.png'),
    ];

    List<PizzaThing> pizzaThingBank = [
      PizzaThing(Name: 'pizza', Price: 330, ImageAddress: 'assets/pizza.png'),
      PizzaThing(Name: 'burger', Price: 330, ImageAddress: 'assets/burger.png'),
      PizzaThing(
          Name: 'Egg - sandwich',
          Price: 330,
          ImageAddress: 'assets/eggSandwich.png'),
    ];

    List nav_items = [
      softDrinkBank,
      pizzaThingBank,
    ];

    return ListView.builder(
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, '/detailview');
                                    },
                                    child: Text(
                                      nav_items[selector_item][index].Name,
                                      style: const TextStyle(
                                        color: Colors.black87,
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "300-birr",
                                    style: TextStyle(
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
    );
  }
}
