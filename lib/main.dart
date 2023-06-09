import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/screens/home/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Theme.of(context).copyWith(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animationController.forward().then((_) => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginScreen())));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ScaleTransition(
          scale: _animationController.drive(
            Tween<double>(
              begin: 1.5,
              end: 1.5,
            ).chain(
              CurveTween(curve: Curves.ease),
            ),
          ),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Stylecommerce",
                    style: GoogleFonts.poppins(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueAccent,
                    )
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    "Style your day",
                    style: GoogleFonts.lato(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueAccent,
                    )
                  ),
                ],
              ),
            ),
          )
        )
      )
    );
  }
}