import 'package:base_project/core/routes/route_name.dart';
import 'package:base_project/core/utils/app_extension.dart';
import 'package:base_project/core/utils/enums/request_state.dart';
import 'package:base_project/core/utils/theme/app_colors.dart';
import 'package:base_project/features/products/controller/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          context.tr.products,

        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart_outlined,
              size: 30,
              color: AppColors.primaryColor,
            ),
            onPressed: () {
              context.pushNamed(NameRoutes.cartNameRoute);
            },
          ),
        ],
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final productProvider = ref.watch(productprovider);

          switch (productProvider.state.requestState) {
            case RequestState.loading:
              return const Center(child: CircularProgressIndicator());
            case RequestState.error:
              return Center(child: Text(productProvider.state.message));
            case RequestState.empty:
              return  Center(child: Text(  context.tr.noData));
            case RequestState.loaded:
              final products = productProvider.state.data;
              final categories = productProvider.categories;

              final filteredProducts = _selectedCategory == null
                  ? products
                  : products
                      .where((product) => product.category == _selectedCategory)
                      .toList();

              List<Widget> categoryWidgets = [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ChoiceChip(
                    showCheckmark: false,
                    color: WidgetStateProperty.all(
                      _selectedCategory == null
                          ? Colors.black
                          : Colors.grey[200],
                    ),
                    side: BorderSide(
                      style: BorderStyle.none,
                    ),
                    labelStyle: TextStyle(
                      color: _selectedCategory == null
                          ? Colors.white
                          : Colors.black,
                    ),
                    label: const Text('All'),
                    selected: _selectedCategory == null,
                    onSelected: (_) {
                      setState(() {
                        _selectedCategory = null;
                      });
                    },
                  ),
                ),
              ];
              categories.forEach((category) {
                categoryWidgets.add(
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ChoiceChip(
                      side: BorderSide(color: Colors.transparent),
                      disabledColor: Colors.black,
                      showCheckmark: false,
                      color: WidgetStateProperty.all(
                        _selectedCategory == category
                            ? Colors.black
                            : Colors.grey[200],
                      ),
                      labelStyle: TextStyle(
                        color: _selectedCategory == category
                            ? Colors.white
                            : Colors.black,
                      ),
                      label: Text(category),
                      selected: _selectedCategory == category,
                      onSelected: (_) {
                        setState(() {
                          _selectedCategory = category;
                        });
                      },
                    ),
                  ),
                );
              });

              return Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: categoryWidgets,
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(8.0),
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        final product = filteredProducts[index];
                        return InkWell(
                          onTap: () {
                            context.pushNamed(
                              NameRoutes.productDetailNameRoute,
                              extra: product,
                            );
                          },
                          overlayColor:
                              WidgetStateProperty.all(Colors.transparent),
                          child: Column(
                            children: [
                              Image.network(
                                product.image,
                                width: 70,
                                height: 70,
                              ),
                              Text(
                                product.title,
                                maxLines: 3,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "${product.price}\$",
                                style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        childAspectRatio: 1,
                      ),
                    ),
                  ),
                ],
              );
          }
        },
      ),
    );
  }
}
