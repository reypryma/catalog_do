import 'package:catalog_do/data/model/product.dart';
import 'package:catalog_do/data/repository.dart';
import 'package:catalog_do/layout/app_layout.dart';
import 'package:catalog_do/theme/app_theme.dart';
import 'package:catalog_do/ui/screen/products/components/search_not_found.dart';
import 'package:catalog_do/ui/screen/products/components/search_products.dart';
import 'package:catalog_do/ui/widgets/loader_widget.dart';
import 'package:flutter/material.dart';

import '../../../constant/constant.dart';
import '../../../constant/style.dart';
import '../../../layout/responsive.dart';
import '../../widgets/search_catalog.dart';

class SearchProductsScreen extends StatefulWidget {
  const SearchProductsScreen({super.key});

  @override
  State<SearchProductsScreen> createState() => _SearchProductsScreenState();
}

class _SearchProductsScreenState extends State<SearchProductsScreen> {
  final AppTheme _appTheme = AppTheme();
  List<ShProduct> products = [];
  List<ShProduct> filteredList = [];
  bool _isLoading = true;

  final TextEditingController _searchController = TextEditingController();
  var searchText = "";

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future fetchData() async {
    debugPrint("Search: $searchText");
    _isLoading = true;
    products.clear();
    filteredList.clear();
    products = await loadProducts();

    for (var product in products) {
      if (product.name!.toLowerCase().contains(searchText)) {
        filteredList.add(product);
      }
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    String title = "Search product";

    return LayoutBuilder(builder: (context, constraints) {
      return AppScaffold(
        title: title,
        backbutton: "hide",
        invisibleAppBar: hideScaffoldAppBar,
        body: AppContentView(
          title: title,
          mobile: MobileView(
            widget: _buildContent(context),
          ),
          desktop: DesktopView(
            title: title,
            invisibleAppBar: hideScaffoldAppBar,
            widget: _buildContent(context),
          ),
        ),
      );
    });
  }

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: sAllSidesGap,
        child: Column(
          children: [
            Container(
              constraints: Responsive().contentAreaWidth(),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                    offset: const Offset(0.5, 0.0),
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(12)),
                border: Border.all(
                    color: _appTheme.getTheme().colorScheme.primaryContainer,
                    width: 0.5),
                color: _appTheme.getTheme().colorScheme.surfaceContainer,
              ),
              child: Padding(
                  padding: Responsive().deviceType() == "desktop"
                      ? sHorizontalGap
                      : EdgeInsets.zero,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                                controller: _searchController,
                                obscureText: false,
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                ),
                                onChanged: (value) {
                                  setState(() {

                                  });
                                },
                                decoration: searchCatalogDecoration(
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: _appTheme
                                        .getTheme()
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                                  showPreFixIcon: true,
                                  hintText: "Search product name",
                                  suffixIcon: _searchController.text.isNotEmpty
                                      ? IconButton(
                                          icon: Icon(
                                            Icons.clear,
                                            color: _appTheme
                                                .getTheme()
                                                .colorScheme
                                                .onSurfaceVariant,
                                          ),
                                          onPressed: () {
                                            _searchController.clear();
                                            searchText = "";
                                            fetchData();
                                          },
                                        )
                                      : null,
                                )),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          IconButton(
                            onPressed: () {
                              searchText = _searchController.text;
                              fetchData();
                              setState(() {

                              });
                            },
                            icon: Icon(Icons.send, size: 30),
                          )
                        ],
                      ),
                    ],
                  )),
            ),
            SizedBox(height: 16,),
            _showSearchedProduct()
          ],
        ),
      ),
    );
  }

  Widget _showSearchedProduct() {
    debugPrint("filter ${filteredList.length}");
    return Container(
      constraints: Responsive().contentAreaWidth(),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        border: Border.all(
            color: _appTheme.getTheme().colorScheme.primaryContainer,
            width: 0.5),
        color: _appTheme.getTheme().colorScheme.surfaceContainer,
      ),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: _isLoading
            ? LoaderWidget(
                color: _appTheme.getTheme().colorScheme.primary,
              )
            : filteredList.isEmpty
                ? SearchNotFound(message: _searchController.text)
                : SearchProducts(
                    products: filteredList,
                  ),
      ),
    );
  }
}
