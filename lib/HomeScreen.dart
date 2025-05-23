import 'package:flutter/material.dart';
import 'package:read_hear/LoginScreen.dart'; // Make sure to import the next screen

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            image: AssetImage('assets/images/back.png'),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.black.withAlpha((0.8 * 255).round()),
                  Colors.black.withAlpha((0.15 * 255).round()),
                  Colors.black.withAlpha((0.5 * 255).round()),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Image(
                height: 300,
                width: 300,
                image: AssetImage('assets/images/Read_hear.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
