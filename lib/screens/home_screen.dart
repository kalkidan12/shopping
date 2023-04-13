import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/model/product_model.dart';
import 'package:provider/services/product_service.dart';
import 'package:provider/widgets/catagory_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    ProductService().fetchAllProduct();
    ProductService().getAllCatagories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 203, 203).withOpacity(0.7),
      appBar: AppBar(
        elevation: 1,
        leading:
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_outlined)),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Our Products'), Text('SortBy')],
            ),
            const SizedBox(
              height: 15,
            ),
            CatagoryList()
          ],
        ),
      ),
    );
  }
}
