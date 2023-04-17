import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChoosePaymentMethod extends StatefulWidget {
  const ChoosePaymentMethod({super.key});

  @override
  State<ChoosePaymentMethod> createState() => _ChoosePaymentMethodState();
}

class _ChoosePaymentMethodState extends State<ChoosePaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CHoose Payment'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromARGB(255, 250, 250, 250),
                boxShadow: [
                  BoxShadow(
                      // color: Color.fromARGB(255, 240, 240, 240),
                      color: Color.fromARGB(255, 222, 222, 222),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(1, 1)),
                ],
              ),
              padding: EdgeInsets.all(10),
              child: Text('Credit Card'),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              child: Text('Google Pay'),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              child: Text('Apple Pay'),
            ),
          ),
        ],
      ),
    );
  }
}
