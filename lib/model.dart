import 'package:flutter/material.dart';

class GadgetModel {
  List<Product> products;
  int total;
  int skip;
  int limit;

  GadgetModel({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  GadgetModel.fromJson(Map<String, dynamic> mp)
      : products = List<Product>.from(
            mp["products"].map((map) => Product.fromJson(map))),
        total = mp['total'],
        skip = mp['skip'],
        limit = mp['limit'];

  Map<String, dynamic> toJson() => {
        'products': products.toString(),
        "total": total.toString(),
        "skip": skip.toString(),
        "limit": limit.toString(),
      };
}

class Product {
  int id;
  String title;
  String description;
  int price;
  double discountPercentage;
  double rating;
  int stock;
  String brand;
  String category;
  String thumbnail;
  List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  Product.fromJson(Map<String, dynamic> mp)
      : id = mp['id'],
        title = mp['title'],
        description = mp['description'],
        price = mp['price'],
        discountPercentage = mp['discountPercentage'],
        rating = mp['rating'],
        stock = mp['stock'],
        brand = mp['brand'],
        category = mp['category'],
        thumbnail = mp['thumbnail'],
        images = mp['images'];

  Map<String, dynamic> toJson() => {
        'id': id.toString(),
        "title": title,
        "description": description,
        "price": price.toString(),
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock.toString(),
        "brand": brand,
        "category": category,
        "thumbnail": thumbnail,
        "images": images,
      };
}
