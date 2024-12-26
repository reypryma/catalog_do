import 'dart:convert';
import 'package:flutter/services.dart';
import 'model/category.dart';
import 'model/product.dart';

Future<String> loadContentAsset(String path) async {
  return await rootBundle.loadString(path);
}

Future<List<DcCategory>> loadCategory() async {
  String jsonString = await loadContentAsset('assets/data/category.json');
  final jsonResponse = json.decode(jsonString);
  return (jsonResponse as List).map((i) => DcCategory.fromJson(i)).toList();
}

Future<List<Product>> loadProducts() async {
  String jsonString = await loadContentAsset('assets/data/products.json');
  final jsonResponse = json.decode(jsonString);
  return (jsonResponse as List).map((i) => Product.fromJson(i)).toList();
}
