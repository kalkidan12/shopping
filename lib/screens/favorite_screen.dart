import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/provider/cart_provider.dart';
import 'package:shopping/provider/favorite_provider.dart';
import 'package:shopping/widgets/empty_cart.dart';
import 'package:shopping/widgets/empty_favorite.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 1,
          title: Text(
            'Favorite',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
            child: Column(
              children: [
                Consumer<FavoriteProvider>(
                    child: EmptyFavorite(),
                    builder: (context, cart, ch) {
                      return cart.favoriteItems.isEmpty
                          ? ch!
                          : ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(10),
                              scrollDirection: Axis.vertical,
                              itemCount: cart.favoriteItems.length,
                              separatorBuilder: (_, __) => Container(
                                height: 12,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                final item =
                                    cart.favoriteItems.values.toList()[index];
                                final id =
                                    cart.favoriteItems.keys.toList()[index];

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
                                          height: 100,
                                          child:
                                              Image.network(item.productImage),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.productTitle,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            Text(
                                              item.productDescription,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Text(
                                              '\$' +
                                                  item.productPrice.toString(),
                                              textAlign: TextAlign.left,
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ],
                                        ),
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
