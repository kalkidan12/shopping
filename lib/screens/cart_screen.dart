import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.teal,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartScreen()));
          },
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
          label: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '4',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(width: 10),
              Text(
                'Proceed To Pay',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 10),
              Text(
                '\$555',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
            child: Column(
              children: [
                Container(
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(10),
                    scrollDirection: Axis.vertical,
                    itemCount: 4,
                    separatorBuilder: (_, __) => Container(
                      height: 12,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.all(10),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Burger & Chips',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color:
                                              Color.fromARGB(255, 37, 37, 37)),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '\$556',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color:
                                              Color.fromARGB(255, 37, 37, 37)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.teal.withOpacity(0.05)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            print('decrement');
                                            setState(() {
                                              // priceController += 1;
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.remove_circle,
                                            color: Colors.teal,
                                          )),
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        child: Text(
                                          '1',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            print('increment');
                                          },
                                          icon: const Icon(
                                            Icons.add_box,
                                            color: Colors.teal,
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.remove_circle,
                                    color: Colors.red,
                                  )),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ));
  }
}
