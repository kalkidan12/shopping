import 'dart:convert';

import 'package:provider/model/product_model.dart';
import 'package:provider/utils/constants.dart';
import 'package:http/http.dart' as http;

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

  Future<List<ProductModel>?> fetchAllProduct() async {
    List<ProductModel> allProducts = [];
    var uri = Uri.parse(Constants.ProductApiBaseUrl);
    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        allProducts.add(jsonDecode(response.body));
        return allProducts;
      }
    } catch (e) {
      print(e);
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
