import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/provider/cart_provider.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color.fromARGB(255, 54, 54, 54),
            )),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  alignment: Alignment.center,
                  // width: MediaQuery.of(context).size.width - 50,
                  height: 200,
                  child: Image.network(arguments['product-image'])),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      arguments['product-title'],
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.teal,
                            content: Text(arguments['product-title'] +
                                ' Added To Favorite successfully')));
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.grey,
                        size: 30,
                      ))
                ],
              ),
              Text(
                arguments['product-description'],
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$' + arguments['product-price'].toString(),
                    style: TextStyle(fontSize: 22),
                  ),
                  Row(
                    children: [
                      Text(
                        '4.8',
                        style: TextStyle(fontSize: 18),
                      ),
                      Icon(
                        Icons.star,
                        size: 30,
                        color: Colors.amber,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.teal.withOpacity(0.05)),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add,
                              color: Colors.teal,
                            )),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            '2',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove,
                              color: Colors.teal,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () {
                          cartProvider.addToCart(
                              arguments['product-id'].toString(),
                              arguments['product-title'],
                              double.parse(
                                  arguments['product-price'].toString()),
                              1);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.teal,
                              content: Text(arguments['product-title'] +
                                  ' Added To Cart Successfully')));
                        },
                        child: Text(
                          'Add To Cart',
                          style: TextStyle(fontSize: 16),
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
