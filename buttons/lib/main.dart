import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.deepPurpleAccent,
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black.withOpacity(0.8),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mi APP de botones',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildSwipeButton(
              color: Colors.red,
              icon: Icons.double_arrow,
              text: 'Swipe to ...',
              textColor: Colors.white,
              borderRadius: 15,
              height: 50,
            ),
            buildSwipeButton(
              color: Colors.lightBlue,
              icon: Icons.arrow_forward,
              text: 'Dar un toque',
              textColor: Colors.white,
              borderRadius: 25,
              height: 60,
              iconSize: 28,
            ),
            buildSwipeButton(
              color: Colors.orangeAccent,
              icon: Icons.arrow_forward,
              text: 'Desliza',
              textColor: Colors.black,
              fontWeight: FontWeight.bold,
              borderRadius: 0,
              height: 45,
              width: 230,
              iconSize: 20,
            ),
            buildSwipeButton(
              color: Colors.yellow,
              icon: Icons.arrow_right,
              text: 'Siguiente',
              textColor: Colors.black,
              borderRadius: 50,
              height: 55,
              width: 260,
              iconSize: 30,
            ),
            buildSwipeButton(
              color: Colors.greenAccent,
              icon: Icons.arrow_forward_ios,
              text: 'Ir',
              textColor: Colors.white,
              borderRadius: 10,
              height: 50,
              width: 250,
              iconSize: 22,
            ),
            buildSwipeButton(
              color: Colors.deepPurpleAccent,
              icon: Icons.keyboard_arrow_right,
              text: 'Volver',
              textColor: Colors.white,
              borderRadius: 20,
              height: 50,
              width: 270,
              iconSize: 24,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black.withOpacity(0.9),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 28),
            label: 'Minha conta',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, size: 28),
            label: 'Meus pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, size: 28),
            label: 'Favoritos',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.white.withOpacity(0.6),
        showUnselectedLabels: false,
        onTap: _onItemTapped,
        elevation: 10,
      ),
    );
  }

  Widget buildSwipeButton({
    required Color color,
    required IconData icon,
    required String text,
    required Color textColor,
    double borderRadius = 25,
    double height = 50,
    double width = 250,
    double iconSize = 24,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onHorizontalDragEnd: (details) {
          // Acción al deslizar el botón
          if (kDebugMode) {
            print('$text deslizado');
          }
        },
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Icon(icon, color: textColor, size: iconSize),
              ),
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontWeight: fontWeight,
                ),
              ),
              const SizedBox(width: 16), // Espacio para equilibrar el texto
            ],
          ),
        ),
      ),
    );
  }
}
