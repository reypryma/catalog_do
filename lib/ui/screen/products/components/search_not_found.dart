import 'package:catalog_do/constant/app_text.dart';
import 'package:flutter/material.dart';

class SearchNotFound extends StatelessWidget {
  final String message;

  const SearchNotFound({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 80,
        ),
        AppText.displayMedium("No results found for \"$message\"",
            fontWeight: 600, textAlign: TextAlign.center),
        SizedBox(
          height: 5,
        ),
        AppText.headlineMedium(
          "Search with other keywords",
        ),
        SizedBox(
          height: 80,
        ),
      ],
    ));
  }
}
