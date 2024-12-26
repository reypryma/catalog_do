import 'package:catalog_do/constant/variable_constant.dart';
import 'package:catalog_do/constant/style_constant.dart';
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
  List<Product> featuredProducts = [];
  var position = 0;
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
        debugPrint(error);
      }
      if(mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to load data')));
    });
    List<Product> products = await loadProducts();
    List<Product> featured = [];
    for (var product in products) {
      if (product.featured!) {
        featured.add(product);
      }
    }
    setState(() {
      featuredProducts.clear();
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
                    context,
                    Responsive().deviceType(),
                    deviceWidth!, "catalogs"),
                limit: 6,
                spacing: 10.0,
              )
            ],
          )
        : Container();
  }
}
