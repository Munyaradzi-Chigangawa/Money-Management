import 'package:flutter/material.dart';
import 'package:money_management_app/onBoarding/onBoarding.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:OnboardingScreen(),
    );
  }
}