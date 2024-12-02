import 'package:base_project/core/routes/route_name.dart';
import 'package:base_project/core/utils/app_extension.dart';
import 'package:base_project/features/products/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:base_project/features/products/controller/product_provider.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final productProvider = ref.watch(productprovider);

      final List<ProductModel>? allProducts =
          productProvider.state.data as List<ProductModel>?;

      final matchingProducts = allProducts
          ?.where((product) =>
              product.title.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();

      return Scaffold(
        appBar: AppBar(
            title: Container(
          child: TextField(
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
            },
            decoration: InputDecoration(
                hintText: context.tr.search,
                hintStyle: TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.white),
                )),
            style: TextStyle(color: Colors.black),
          ),
        )),
        body: _searchQuery.isEmpty
            ? SizedBox()
            : (matchingProducts != null && matchingProducts.isNotEmpty
                ? ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: matchingProducts.length,
                    itemBuilder: (context, index) {
                      final product = matchingProducts[index];
                      return ListTile(
                        leading:
                            Image.network(product.image, width: 50, height: 50),
                        title: Text(product.title),
                        subtitle: Text("${product.price}\$"),
                        onTap: () {
                          context.pushNamed(
                            NameRoutes.productDetailNameRoute,
                            extra: product,
                          );
                        },
                      );
                    },
                  )
                :  Center(
                    child: Text(          context.tr.noMatchingProducts),
                  )),
      );
    });
  }
}
