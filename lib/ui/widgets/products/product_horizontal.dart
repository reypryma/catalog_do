import 'package:catalog_do/layout/app_text.dart';
import 'package:catalog_do/data/model/product.dart';
import 'package:catalog_do/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ProductHorizontal extends StatelessWidget {
  final ShProduct product;
  final VoidCallback? ontap;
  const ProductHorizontal({super.key, required this.product, this.ontap});

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = AppTheme();

    return Row(
      children: [
        Flexible(
          flex: 2,
          child: ClipRRect(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: Image.asset(
              '${product.images![0].src}',
              height: 50,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppText.titleMedium(
                product.name ?? "",
                fontWeight: 600,
              ),
              SizedBox(height: 4,),
              AppText.labelMedium(
                product.categories![0].name ?? "",
                color: appTheme.getTheme().colorScheme.onTertiaryContainer,
                overflow: TextOverflow.ellipsis,
                fontWeight: 600,
              ),
            ],
          ),
        )
      ],
    );
  }
}
