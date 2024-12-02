import 'package:base_project/core/utils/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

abstract class PublicMethods {
  static String formatPrice(num price) {
    final formatPrice = NumberFormat.currency(locale: 'ar', symbol: '');
    return formatPrice.format(price).replaceAll('.00', '');
  }

  static String formaDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    final String formattedDate =
        DateFormat('yyyy-MM-dd', 'en').format(dateTime);
    return formattedDate;
  }

  static void displaySnackBar({
    required BuildContext context,
    required String message,
    Color color = Colors.red,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          message,
          style: const TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
        backgroundColor: color));
  }

  static void displayDialog(
      {required BuildContext context, required String content}) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        alignment: Alignment.center,
        contentPadding: 20.allPad,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.redAccent,
              child: Icon(Icons.error_outline_rounded),
            ),
            Text(
              "error happened",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        children: [
          Center(
              child: Text(
            content,
            style: TextStyle(
              fontSize: 18,
            ),
          )),
        ],
      ),
    );
  }
}
