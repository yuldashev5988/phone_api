import 'dart:convert';

import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:phone_api/model.dart';

class ProductService {
  static var logger = Logger();
  static String BASE = 'dummyjson.com';
  static Map<String, String> header = {};

  //API

  static String GET_API = 'products';
  static String POST_API = 'products/add';
  static String SEARCH_API = 'products/search?q=phone';
  static String GET_CATEGORIES_API = 'products/categories';
  static String DELETE_API = 'products/'; //+id

  static Future<String?> GET(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE, api, params);
    Response response = await get(uri, headers: header);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

 static Future<String?> GET_CATAGORY(
  String api, Map<String, dynamic> params) async {
 var uri = Uri.https(BASE, api, params);
 Response response = await get(uri, headers: header);
 if (response.statusCode == 200) {
  return response.body;
 }
 return null;
 }

  // static Future<String?> SEARCH(String api, Map<String, dynamic> params) async {
  //   var uri = Uri.https(BASE, api, params);
  //   Response response = await get(uri, headers: header);
  //   if (response.statusCode == 200) {
  //     return response.body;
  //   }
  //   return null;
  // }

  static Future<String?> POST(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE, api, params);
    Response response =
        await post(uri, headers: header, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE, api, params);
    Response response =
        await put(uri, headers: header, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DELETE(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE, api);
    Response response = await delete(uri, headers: header);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Map<String, dynamic> paramsGet() {
    Map<String, dynamic> params = {};
    return params;
  }

  static Map<String, dynamic> paramsSearch() {
    Map<String, dynamic> params = {};
    return params;
  }

  static Map<String, dynamic> paramsGetCatagory() {
    Map<String, dynamic> params = {};
    return params;
  }

  static paramsPost({required Product product}) {
    Product produ = Product(
        id: product.id,
        title: product.title,
        description: product.description,
        price: product.price,
        discountPercentage: product.discountPercentage,
        rating: product.rating,
        stock: product.stock,
        brand: product.brand,
        category: product.category,
        thumbnail: product.thumbnail,
        images: product.images);

    return produ.toJson();
  }

  static paramsPut({required Product product}) {
    Product produ = Product(
        id: product.id,
        title: product.title,
        description: product.description,
        price: product.price,
        discountPercentage: product.discountPercentage,
        rating: product.rating,
        stock: product.stock,
        brand: product.brand,
        category: product.category,
        thumbnail: product.thumbnail,
        images: product.images);

    return produ.toJson();
  }

  static Map<String, dynamic> paramsDelete() {
    Map<String, dynamic> params = {};
    return params;
  }

  static List<Product> parsingResponse(String response) {
    Map json = jsonDecode(response);
    List<Product> data = List<Product>.from(
      json['products'].map(
        (product) => Product.fromJson(product),
      ),
    );
    return data;
  }
}
