import 'package:base_project/features/cart/model/cart_model.dart';
import 'package:base_project/features/products/controller/product_provider.dart';
import 'package:base_project/features/products/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider = ChangeNotifierProvider((ref) {
  return CartProvider();
});

class CartProvider extends ChangeNotifier {
  final cart = <int, CartItem>{};

  double get total => cart.values
      .map((item) => item.price * item.quantity)
      .fold(0.0, (a, b) => a + b);

  void addToCart(int id, WidgetRef ref) {
    if (cart.containsKey(id)) {
      cart[id]!.quantity++;
    } else {
      final item = ref
          .read(productprovider)
          .state
          .data
          .firstWhere((element) => element.id == id);

      cart[id] = CartItem(
        img: item.image,
        id: item.id,
        price: item.price,
        quantity: 1,
        name: item.title,
      );
    }
    notifyListeners();
  }

  void removeFromCart(int id) {
    if (cart.containsKey(id)) {
      if (cart[id]!.quantity > 1) {
        cart[id]!.quantity--;
      } else {
        cart.remove(id);
      }
      notifyListeners();
    }
  }

  // Old methods

  void oldAdd(ProductModel item) {
    if (cart.containsKey(item.id)) {
      cart[item.id]!.quantity++;
    } else {
      cart[item.id] = CartItem(
        img: item.image,
        id: item.id,
        price: item.price,
        quantity: 1,
        name: item.title,
      );
    }
  }

  void oldRemove(ProductModel item) {
    if (cart.containsKey(item.id)) {
      if (cart[item.id]!.quantity > 1) {
        cart[item.id]!.quantity--;
      } else {
        cart.remove(item.id);
      }
    }
  }

  // old call from cart screen [cart_screen.dart] ** same logic for oldRemove method **
//  ref.read(cartProvider).oldAdd(ProductModel(id: cartItem.id,   title: cartItem.name,price: cartItem.price,description: cartItem.name,category: "",image: cartItem.img,));
}
