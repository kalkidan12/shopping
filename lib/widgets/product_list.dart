import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shopping/services/product_service.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  Future<List<dynamic>>? productsList;
  Future<List<dynamic>?> getProducts() async {
    productsList = ProductService.getAllProducts();
    print(productsList!);
    return productsList;
  }

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
        future: ProductService.getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<dynamic> products = snapshot.data!;
            return Container(
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 240, // here set custom Height You Want
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: products.length,
                  itemBuilder: ((context, index) => GestureDetector(
                        onTap: (() {
                          Navigator.pushNamed(context, '/product-detail',
                              arguments: {
                                'product-title': products[index]['title'],
                                'product-image': products[index]['images'][0],
                                'product-description': products[index]
                                    ['description'],
                                'product-price': products[index]['price'],
                              });
                        }),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(255, 212, 212, 212),
                                    blurRadius: 4,
                                    offset: Offset(0, 2))
                              ],
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Column(
                            children: [
                              Container(
                                  height: 100,
                                  width: 100,
                                  padding: EdgeInsets.all(0),
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            products[index]['images'][0]
                                            // 'https://i.dummyjson.com/data/products/1/thumbnail.jpg',
                                            ),
                                        fit: BoxFit.cover),
                                    // borderRadius:
                                    //     BorderRadius.all(Radius.circular(50))
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      products[index]['title'],
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color:
                                              Color.fromARGB(255, 0, 88, 79)),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                '\$' + products[index]['price'].toString(),
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 0, 88, 79)),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              RatingBar.builder(
                                ignoreGestures: true,
                                itemSize: 25,
                                initialRating: double.parse(
                                    products[index]['rating'].toString()),
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 2.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              )
                            ],
                          ),
                        ),
                      ))),
            );
          } else if (snapshot.hasError) {
            return Container(
                width: 40, height: 40, child: CircularProgressIndicator());
          } else {
            return Container(
                width: 40, height: 40, child: CircularProgressIndicator());
          }
        });
  }
}
