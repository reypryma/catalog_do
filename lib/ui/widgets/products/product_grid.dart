import 'package:catalog_do/data/model/product.dart';
import 'package:catalog_do/ui/screen/products/detail_product_screen.dart';
import 'package:catalog_do/ui/widgets/products/product_card.dart';
import 'package:flutter/material.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    super.key,
    required this.data,
    required this.columns,
    this.spacing,
    this.limit,
  });
  final List<ShProduct> data;
  final int columns;
  final double? spacing;
  final int? limit;
  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    int count = 0;
    bool allow = true;

    for (var element in data) {
      if (allow) {
        items.add(MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return DetailProductScreen(product: element);
              }));
            },
            child: ProductCard(
              blog: element,
            ),
          ),
        ));
      }
      count++;
      if (limit != null && count >= limit!) {
        allow = false;
      }
    }

    return GridView.builder(
      shrinkWrap: true,
      primary: true,
      itemCount: items.length,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 600,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        mainAxisExtent: 600,
      ),
      itemBuilder: (BuildContext context, int index) {
        return items[index];
      },
    );
  }
}
