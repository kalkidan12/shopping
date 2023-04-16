import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/screens/product_detail.dart';

import 'screens/home_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
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
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      routes: {'/product-detail': (context) => ProductDetail()},
      home: const HomeScreen(),
    );
  }
}
