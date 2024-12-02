// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CartItem extends Equatable {
  final String img;
  final int id;
  final double price;
  int quantity;
  final String name;

  CartItem(
      {required this.img,
      required this.id,
      required this.price,
      required this.quantity,
      required this.name});

  toJson() {
    return {
      'img': img,
      'id': id,
      'price': price,
      'quantity': quantity,
      'name': name,
    };
  }

  static CartItem fromJson(Map<String, dynamic> itemJson) {
    return CartItem(
      img: itemJson['img'],
      id: itemJson['id'],
      price: itemJson['price'],
      quantity: itemJson['quantity'],
      name: itemJson['name'],
    );
  }

  @override
  List<Object> get props {
    return [
      img,
      id,
      price,
      quantity,
      name,
    ];
  }
}
