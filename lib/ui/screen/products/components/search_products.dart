import 'package:catalog_do/data/model/product.dart';
import 'package:catalog_do/ui/screen/products/detail_product_screen.dart';
import 'package:catalog_do/ui/widgets/products/product_horizontal.dart';
import 'package:flutter/material.dart';

class SearchProducts extends StatelessWidget {
  final List<Product> products;

  const SearchProducts({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: products.length,
      padding: EdgeInsets.all(16),
      itemBuilder: (context, index) {
        Product product = products[index];
        return InkWell(
            child: ProductHorizontal(product: product),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return DetailProductScreen(product: product);
            }));
          },
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: Theme.of(context).colorScheme.onSecondaryContainer,
        );
      },
    );
  }
}
