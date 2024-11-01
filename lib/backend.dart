// ignore_for_file: camel_case_types, non_constant_identifier_names
class softDrink {
  String Name;
  int Price;
  String ImageAddress;
  softDrink(
      {required this.Name, required this.Price, required this.ImageAddress});
}

class pasta {
  String Name;
  int Price;
  String ImageAddress;

  pasta({required this.Name, required this.Price, required this.ImageAddress});
}

class pizzaThing {
  String Name;
  int Price;
  String ImageAddress;
  pizzaThing(
      {required this.Name, required this.Price, required this.ImageAddress});
}

class shiroNegar {
  String Name;
  int Price;
  String ImageAddress;
  shiroNegar(
      {required this.Name, required this.Price, required this.ImageAddress});
}

List<softDrink> softDrinkBank = [
      softDrink(Name: 'Coca-Cola', Price: 60, ImageAddress: 'assets/coca.png'),
      softDrink(Name: 'Pepsi', Price: 50, ImageAddress: 'assets/pepsi.png'),
      softDrink(
          Name: 'Fanta Orange', Price: 55, ImageAddress: 'assets/fanta.png'),
      softDrink(Name: 'Sprite', Price: 50, ImageAddress: 'assets/sprite.png'),
      softDrink(Name: 'Mirinda', Price: 45, ImageAddress: 'assets/water.png'),
      softDrink(
          Name: 'Ambo Mineral Water',
          Price: 30,
          ImageAddress: 'assets/water.png'),
      softDrink(
          Name: 'Aquasafe Water', Price: 25, ImageAddress: 'assets/water.png'),
      softDrink(
          Name: 'Super Eagle Energy Drink',
          Price: 100,
          ImageAddress: 'assets/water.png'),
      softDrink(
          Name: 'Fanta Pineapple', Price: 55, ImageAddress: 'assets/water.png'),
      softDrink(
          Name: 'Soda Water', Price: 40, ImageAddress: 'assets/water.png'),
    ];
    List<pasta> pastaBank = [
      pasta(
          Name: 'Spaghetti Bolognese',
          Price: 180,
          ImageAddress: 'assets/4.png'),
      pasta(
          Name: 'Penne Alfredo',
          Price: 200,
          ImageAddress: 'assets/2.png'),
      pasta(
          Name: 'Rice with Vegetables',
          Price: 150,
          ImageAddress: 'assets/3.png'),
      pasta(
          Name: 'Macaroni with Sauce',
          Price: 170,
          ImageAddress: 'assets/4.png'),
      pasta(Name: 'Lasagna', Price: 220, ImageAddress: 'assets/2.png'),
      pasta(
          Name: 'Fettuccine Alfredo',
          Price: 210,
          ImageAddress: 'assets/1.png'),
      pasta(
          Name: 'Rice with Beef',
          Price: 190,
          ImageAddress: 'assets/2.png'),
      pasta(
          Name: 'Macaroni',
          Price: 200,
          ImageAddress: 'assets/3.png'),
      pasta(
          Name: 'Spaghetti',
          Price: 160,
          ImageAddress: 'assets/4.png'),
      pasta(
          Name: 'Rice Pilaf',
          Price: 180,
          ImageAddress: 'assets/1.png'),
    ];

    List<pizzaThing> pizzaThingBank = [
      pizzaThing(
          Name: 'Margarita Pizza',
          Price: 200,
          ImageAddress: 'assets/pizza.png'),
      pizzaThing(
          Name: 'Vegetarian Pizza',
          Price: 220,
          ImageAddress: 'assets/pizza.png'),
      pizzaThing(
          Name: 'Cheeseburger', 
          Price: 180,
           ImageAddress: 'assets/burger.png'),
      pizzaThing(
          Name: 'Chicken Burger',
          Price: 190,
          ImageAddress: 'assets/burger.png'),
      pizzaThing(
          Name: 'Club Sandwich',
          Price: 150,
          ImageAddress: 'assets/eggSandwich.png'),
      pizzaThing(
          Name: 'Hawaiian Pizza',
           Price: 240, 
           ImageAddress: 'assets/pizza.png'),
      pizzaThing(
          Name: 'Beef Burger',
           Price: 200,
           ImageAddress: 'assets/burger.png'),
      pizzaThing(
          Name: 'Panini Sandwich',
          Price: 140,
          ImageAddress: 'assets/eggSandwich.png'),
      pizzaThing(
          Name: 'Pepperoni Pizza',
          Price: 230,
          ImageAddress: 'assets/pizza.png'),
      pizzaThing(
          Name: 'Veggie Burger', 
          Price: 160, 
          ImageAddress: 'assets/burger.png'),
    ];
    List<shiroNegar> shiroNegarBank = [
      shiroNegar(
        Name: 'Shiro',
         Price: 100,
          ImageAddress: 'assets/1.png'),
      shiroNegar(
          Name: 'Misir Wot',
          Price: 120,
          ImageAddress: 'assets/1.png'),
      shiroNegar(
          Name: 'Key Wot',
          Price: 180,
          ImageAddress: 'assets/1.png'),
      shiroNegar(
          Name: 'Alicha Wot',
          Price: 150,
          ImageAddress: 'assets/1.png'),
      shiroNegar(
          Name: 'Gomen',
          Price: 90,
          ImageAddress: 'assets/1.png'),
      shiroNegar(
          Name: 'Doro Wot',
          Price: 250,
          ImageAddress: 'assets/1.png'),
      shiroNegar(
          Name: 'Atkilt Wot',
          Price: 110,
          ImageAddress: 'assets/1.png'),
      shiroNegar(
          Name: 'Kik Alicha',
          Price: 130,
          ImageAddress: 'assets/1.png'),
      shiroNegar(
        Name: 'Firfir', 
        Price: 140, 
        ImageAddress: 'assets/1.png'),
      shiroNegar(
          Name: 'Tegabino Shiro', 
          Price: 160,
           ImageAddress: 'assets/1.png'),
    ];