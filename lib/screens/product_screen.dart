import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/catagory_list.dart';
import '../widgets/product_list.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          'Shopping',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Container(
            // height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Our Products',
                      style: TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(255, 0, 88, 79),
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Sort by',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 0, 88, 79),
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.sort_by_alpha,
                              color: Color.fromARGB(255, 0, 88, 79),
                            ))
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CatagoryList(),
                const SizedBox(
                  height: 15,
                ),
                ProductList(),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
