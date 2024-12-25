import 'dart:convert';
import 'package:flutter/services.dart';

import 'model/address.dart';
import 'model/attribute.dart';
import 'model/category.dart';
import 'model/order.dart';
import 'model/product.dart';

Future<String> loadContentAsset(String path) async {
  return await rootBundle.loadString(path);
}

Future<List<ShCategory>> loadCategory() async {
  String jsonString = await loadContentAsset('assets/data/category.json');
  final jsonResponse = json.decode(jsonString);
  return (jsonResponse as List).map((i) => ShCategory.fromJson(i)).toList();
}

Future<List<ShProduct>> loadProducts() async {
  String jsonString = await loadContentAsset('assets/data/products.json');
  final jsonResponse = json.decode(jsonString);
  return (jsonResponse as List).map((i) => ShProduct.fromJson(i)).toList();
}

Future<List<ShProduct>> loadCartProducts() async {
  String jsonString = await loadContentAsset('assets/data/cart_products.json');
  final jsonResponse = json.decode(jsonString);
  return (jsonResponse as List).map((i) => ShProduct.fromJson(i)).toList();
}

Future<ShAttributes> loadAttributes() async {
  String jsonString = await loadContentAsset('assets/data/attributes.json');
  final jsonResponse = json.decode(jsonString);
  return ShAttributes.fromJson(jsonResponse);
}

Future<List<ShAddressModel>> loadAddresses() async {
  String jsonString = await loadContentAsset('assets/data/address.json');
  final jsonResponse = json.decode(jsonString);
  return (jsonResponse as List).map((i) => ShAddressModel.fromJson(i)).toList();
}

Future<List<ShOrder>> loadOrders() async {
  String jsonString = await loadContentAsset('assets/data/orders.json');
  final jsonResponse = json.decode(jsonString);
  return (jsonResponse as List).map((i) => ShOrder.fromJson(i)).toList();
}

Future<List<String>> loadBanners() async {
  List<ShProduct> products = await loadProducts();
  List<String> banner = [];

  for (var product in products) {
    if (product.images!.isNotEmpty) {
      banner.add(product.images![0].src!);
    }
  }
  return banner;
}
