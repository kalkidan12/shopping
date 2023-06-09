import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:shopping/constants/strip_constants.dart';
import 'package:shopping/provider/cart_provider.dart';
import 'package:shopping/provider/favorite_provider.dart';
import 'package:shopping/screens/cart_screen.dart';
import 'package:shopping/screens/product_detail.dart';

import 'screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Stripe.publishableKey = StripConstants.STRIPE_PUBLISHABLE_KEY;

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(
      value: CartProvider(),
    ),
    ChangeNotifierProvider.value(
      value: FavoriteProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      routes: {
        '/product-detail': (context) => ProductDetail(),
        '/cart-screen': (context) => CartScreen()
      },
      home: const HomeScreen(),
    );
  }
}
