import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/screens/home_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
            titleMedium: TextStyle(color: Colors.white, fontSize: 20)),
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
