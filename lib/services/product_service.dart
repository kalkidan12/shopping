// firebase
// rest api
//  payment

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopping/model/product_model.dart';
import 'package:shopping/utils/constants.dart';

class ProductService {
  Future getAllCatagories() async {
    var uri = Uri.parse(Constants.ProductApiBaseUrl + '/categories');
    try {
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<List<dynamic>> getAllProducts() async {
    var uri = Uri.parse(Constants.ProductApiBaseUrl);
    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        Map<String, dynamic> mapedData = json.decode(response.body);
        List<dynamic> products = mapedData["products"];

        return products;
      } else {
        print('ellllllllllllllllllllllllse');

        return [];
      }
    } catch (e) {
      print(e.toString());
      print('errrrrrrrrrrrrrrrrrrrrrrrrrrrrrro');
      return [];
    }
  }

  Future<List<ProductModel>?> getProductByCatagory(String catagory) async {
    List<dynamic> allSpecificCatagoryProducts = [];
    var uri = Uri.parse(Constants.ProductApiBaseUrl + '/category/${catagory}');
    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        allSpecificCatagoryProducts.add(await jsonDecode(response.body));
      }
    } catch (e) {}
  }

  Future<List<ProductModel>?> getOneProduct(int id) async {
    ProductModel product;
    var uri = Uri.parse(Constants.ProductApiBaseUrl + '/${id}');
    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        product = await jsonDecode(response.body);
      }
    } catch (e) {}
  }

  Future<List<ProductModel>?> filterProduct(String query) async {
    List<ProductModel> product = [];
    var uri = Uri.parse(Constants.ProductApiBaseUrl + '/search?${query}');
    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        product.add(await jsonDecode(response.body));
      }
    } catch (e) {}
  }

  //Limit and skip products implementation
}
