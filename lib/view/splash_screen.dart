import 'dart:async';

import 'package:flutter/material.dart';
import 'package:user_app/view/home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => MyHomePage(title: 'title'))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 15.0,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    "images/officer.png",
                    height: 250.0,
                    width: 250.0,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                const Text(
                  "Manage The Employe",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF004080),
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Color(0xFFFFA500))),
          ],
        ),
      ),
    );
  }
}
