import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopping/screens/cart_screen.dart';
import 'package:shopping/screens/product_screen.dart';
import 'package:shopping/widgets/bottm_navigation.dart';
import 'package:shopping/widgets/product_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        // backgroundColor: Color.fromARGB(255, 255, 203, 203).withOpacity(0.7),
        appBar: AppBar(
          elevation: 1,
          title: Text(
            'Shooping',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        ),
        body: Container(
          // height: MediaQuery.of(context).size.height,
          child: IndexedStack(
            index: selectedItem,
            children: [
              ProductScreen(),
              ProductList(),
              CartScreen(),
              ProductList()
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(
          selectedItem: selectedItem,
          onTap: (int value) {
            setState(() {
              selectedItem = value;
            });
          },
        ),
      ),
    );
  }
}
