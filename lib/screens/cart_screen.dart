import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/provider/cart_provider.dart';
import 'package:shopping/widgets/empty_cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

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
            children: [
              Text(
                '${cartProvider.itemCount}',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(width: 10),
              Text(
                'CHECKOUT',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 10),
              Text(
                '${cartProvider.totalAmount.roundToDouble()}',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          elevation: 1,
          title: Text(
            'My Cart',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
            child: Column(
              children: [
                Consumer<CartProvider>(
                    child: EmptyCart(),
                    builder: (context, cart, ch) {
                      return cart.cartItems.isEmpty
                          ? ch!
                          : ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(10),
                              scrollDirection: Axis.vertical,
                              itemCount: cart.cartItems.length,
                              separatorBuilder: (_, __) => Container(
                                height: 12,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                final item =
                                    cart.cartItems.values.toList()[index];
                                final id = cart.cartItems.keys.toList()[index];

                                return Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Color.fromARGB(255, 250, 250, 250),
                                    boxShadow: [
                                      BoxShadow(
                                          // color: Color.fromARGB(255, 240, 240, 240),
                                          color: Color.fromARGB(
                                              255, 222, 222, 222),
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          offset: Offset(1, 1)),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item.productTitle,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Color.fromARGB(
                                                        255, 37, 37, 37)),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '\$' +
                                                    item.productPrice
                                                        .toString(),
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Color.fromARGB(
                                                        255, 37, 37, 37)),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.teal
                                                    .withOpacity(0.05)),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                IconButton(
                                                    onPressed: () {
                                                      cartProvider.reduceItem(
                                                          id,
                                                          item.productTitle,
                                                          item.productPrice
                                                              .toDouble(),
                                                          item.productQuantity);
                                                    },
                                                    icon: const Icon(
                                                      Icons.remove_circle,
                                                      color: Colors.teal,
                                                    )),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: Text(
                                                    item.productQuantity
                                                        .toString(),
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                ),
                                                IconButton(
                                                    onPressed: () {
                                                      cartProvider.addItem(
                                                          id,
                                                          item.productTitle,
                                                          item.productPrice
                                                              .toDouble(),
                                                          item.productQuantity);
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
                                            onPressed: () {
                                              cartProvider.removeItem(id);
                                            },
                                            icon: Icon(
                                              Icons.remove_circle,
                                              color: Colors.red,
                                            )),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                    }),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ));
  }
}
