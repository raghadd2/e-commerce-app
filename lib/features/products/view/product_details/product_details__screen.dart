import 'package:base_project/core/routes/route_name.dart';
import 'package:base_project/core/utils/app_extension.dart';
import 'package:base_project/core/utils/public_methods.dart';
import 'package:base_project/core/utils/theme/app_colors.dart';
import 'package:base_project/features/cart/controller/cart_provider.dart';
import 'package:base_project/features/products/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Image.network(product.image,
                      height: 200, fit: BoxFit.cover)),
              16.hGap,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.star, color: Colors.yellow),
                  2.wGap,
                  Text(
                    product.rating.rate.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  8.wGap,
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      " ${product.rating.count} ${context.tr.reviews}",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              16.hGap,
              Text(
                product.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(product.description),
              16.hGap,
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("\$${product.price}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Consumer(builder: (context, ref, child) {
              return InkWell(
                onTap: () {
                  ref.read(cartProvider).addToCart(product.id, ref);
                  PublicMethods.displaySnackBar(
                      color: Colors.green,
                      context: context,
                      message: context.tr.addedToCart);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(context.tr.addToCart,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      )),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
