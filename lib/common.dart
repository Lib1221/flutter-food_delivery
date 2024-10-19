import 'package:flutter/material.dart';

class navbar extends StatefulWidget {
  const navbar({super.key});

  @override
  State<navbar> createState() => _navbarState();
}

class _navbarState extends State<navbar> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.yellow, borderRadius: BorderRadius.circular(20)),
        child: Center(
            child: ElevatedButton(onPressed: () {}, child: Text("Pizza"))),
      ),
    );
  }
}

class bottomBar extends StatefulWidget {
  const bottomBar({super.key});

  @override
  State<bottomBar> createState() => _bottomBarState();
}

class _bottomBarState extends State<bottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            child: const Icon(Icons.home),
          ),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.maps_ugc_rounded),
          ),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.store_mall_directory_outlined),
          ),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.location_on_outlined),
          ),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.history),
          ),
        ],
      ),
    );
  }
}



class bottommenu extends StatefulWidget {
  const bottommenu({super.key});

  @override
  State<bottommenu> createState() => _bottommenuState();
}

class _bottommenuState extends State<bottommenu> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
  backgroundColor: Colors.red[100], // A softer, lighter shade of red for the background
  selectedItemColor: const Color.fromARGB(255, 204, 6, 6), // White color for selected items
  unselectedItemColor: Colors.black87, // Darker color for unselected items
  items: const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      label: 'Profile',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.location_on),
      label: 'map',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.history),
      label: 'history',
    ),
  ],
)

;
  }
}