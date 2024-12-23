import 'package:catalog_do/constant/constant.dart';
import 'package:catalog_do/constant/style.dart';
import 'package:catalog_do/data/model/category.dart';
import 'package:catalog_do/data/repository.dart';
import 'package:catalog_do/layout/responsive.dart';
import 'package:catalog_do/ui/widgets/loader_widget.dart';
import 'package:catalog_do/ui/widgets/products/product_grid.dart';
import 'package:flutter/foundation.dart';
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
      if (kDebugMode) {
        print(error);
      }
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
      featuredProducts.clear();
      banners.clear();
      banners.addAll(banner);
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

    return _isLoading
        ? LoaderWidget(color: Theme.of(context).colorScheme.primary)
        : _listProductWidget();
  }

  Widget _listProductWidget() {
    return featuredProducts.isNotEmpty
        ? Column(
            children: [
              ProductGrid(
                data: featuredProducts,
                columns: responsiveColumns(
                    context, Responsive().deviceType(), deviceWidth!, "blogs"),
                limit: 6,
                spacing: 10.0,
              )
            ],
          )
        : Container();
  }
}
