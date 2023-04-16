import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CatagoryList extends StatefulWidget {
  // Future<List<ProductModel>>? getAllProducts;
  CatagoryList({super.key});

  @override
  State<CatagoryList> createState() => _CatagoryListState();
}

class _CatagoryListState extends State<CatagoryList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: double.infinity,
        child: FutureBuilder(
            future: null,
            builder: (context, snapshot) {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: ((context, index) => Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                            top: 5, left: 10, right: 10, bottom: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        margin: const EdgeInsets.only(right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Data Data',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 0, 88, 79)),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      )));
            }));
  }
}
