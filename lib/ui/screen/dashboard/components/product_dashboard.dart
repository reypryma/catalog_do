import 'package:catalog_do/constant/style.dart';
import 'package:catalog_do/data/model/category.dart';
import 'package:catalog_do/data/repository.dart';
import 'package:catalog_do/ui/component/loader_widget.dart';
import 'package:flutter/material.dart';

import '../../../../data/model/product.dart';

class ProductDashboard extends StatefulWidget {
  const ProductDashboard({super.key});

  @override
  State<ProductDashboard> createState() => _ProductDashboardState();
}

class _ProductDashboardState extends State<ProductDashboard> {
  List<ShCategory> list = [];
  List<String> banners = [];
  List<ShProduct> newestProducts = [];
  List<ShProduct> featuredProducts = [];
  var position = 0;
  var colors = [sh_cat_1, sh_cat_2, sh_cat_3, sh_cat_4, sh_cat_5];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    loadCategory().then((categories) {
      setState(() {
        list.clear();
        list.addAll(categories);
      });
    }).catchError((error) {

    });
    List<ShProduct> products = await loadProducts();
    List<ShProduct> featured = [];
    for (var product in products) {
      if (product.featured!) {
        featured.add(product);
      }
    }
    List<String> banner = [];
    for (var i = 1; i < 7; i++) {
      banner.add("images/products/banners/b$i.jpg");
    }
    setState(() {
      newestProducts.clear();
      featuredProducts.clear();
      banners.clear();
      banners.addAll(banner);
      newestProducts.addAll(products);
      featuredProducts.addAll(featured);
      _isLoading = false;
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return _isLoading ? LoaderWidget(color: Theme.of(context).colorScheme.primary) :
      _listProductWidget()
    ;
  }

  Widget _listProductWidget(){
      return newestProducts.isNotEmpty ? Column(
        children: [

        ],
      ) : Container();
  }

}
