import 'package:base_project/core/routes/route_name.dart';
import 'package:base_project/core/utils/app_extension.dart';
import 'package:base_project/features/cart/controller/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr.cart),
      ),
      body: Consumer(builder: (context, ref, child) {
        final cartProviderState = ref.watch(cartProvider);

        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Visibility(
            visible: cartProviderState.cart.isNotEmpty,
            replacement: Center(
              child: Text(context.tr.cartIsEmpty),
            ),
            child: Column(
              children: [
                if (cartProviderState.cart.isNotEmpty)
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemBuilder: (context, index) {
                        final cartItem =
                            cartProviderState.cart.values.toList()[index];

                        return Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.network(
                                cartItem.img,
                                height: 100,
                                width: 100,
                              ),
                              SizedBox(
                                width: 100,
                                child: Text(
                                  cartItem.name,
                                  maxLines: 2,
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          ref
                                              .read(cartProvider.notifier)
                                              .addToCart(cartItem.id, ref);
                                        },
                                        child: Icon(
                                          Icons.add_circle,
                                          color: Colors.green,
                                        ),
                                      ),
                                      Text(
                                        cartItem.quantity.toString(),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          ref
                                              .read(cartProvider.notifier)
                                              .removeFromCart(cartItem.id);
                                        },
                                        child: Icon(
                                          Icons.remove_circle,
                                          color: Colors.grey[300],
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "\$${cartItem.price}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF00A991),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: cartProviderState.cart.length,
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.tr.total,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                    Text(
                      "\$${cartProviderState.total.round()}",
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    context.pushNamed(NameRoutes.checkoutNameRoute);
                  },
                  child: Text(context.tr.checkout),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
