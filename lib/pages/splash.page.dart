// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:recipes/pages/home.page.dart';
import 'package:recipes/pages/login.page.dart';
import 'package:recipes/pages/register.page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    initSplash();
    super.initState();
  }

  void initSplash() async {
    await Future.delayed(const Duration(seconds: 1));
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => LoginPage()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => HomePage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.black38),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 50, right: 50, top: 50, bottom: 10),
                child: Image.asset('assets/images/Logo.png'),
              ),
              Text(
                'Cooking Done The Easy Way',
                style: TextStyle(
                    color: Color(0xffB2B7C6),
                    fontSize: 15,
                    fontFamily: 'Hellix'),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(400, 50),
                      backgroundColor: Color(0xffF55A00),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const RegisterPage()));
                    },
                    child: Text('Register',
                        style: TextStyle(color: Colors.white))),
              ),
              SizedBox(
                height: 8,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
