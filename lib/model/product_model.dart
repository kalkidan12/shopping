import 'dart:convert';

class ProductModel {
  int id;
  String title;
  String description;
  double price;
  double discountPercentage;
  double rating;
  String brand;
  String category;
  String thumbnail;
  List<String> images;

  ProductModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.discountPercentage,
      required this.rating,
      required this.brand,
      required this.category,
      required this.thumbnail,
      required this.images});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'] ?? "",
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      price: json['price'] ?? "",
      discountPercentage: json['discountPercentage'] ?? "",
      rating: json['rating'] ?? "",
      brand: json['brand'] ?? "",
      category: json['category'] ?? "",
      thumbnail: json['thumbnail'] ?? "",
      images: List<String>.from(json["images"].map((x) => x)));

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'discountPercentage': discountPercentage,
        'rating': rating,
        'brand': brand,
        'category': category,
        'thumbnail': thumbnail,
        'images': List<dynamic>.from(images.map((x) => x)),
      };

  // static List<ProductModel> productModelFromJson(List jsonData) {
  //   return jsonData.map((data) => ProductModel.fromJson(data)).toList();
  // }

  // static String productModelToJson(ProductModel data) =>
  //     json.encode(data.toJson());
}
