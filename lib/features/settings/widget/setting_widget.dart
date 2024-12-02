import 'package:flutter/material.dart';

class Settings_widget extends StatelessWidget {
  const Settings_widget({
    required this.child,
    super.key,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xffF5F5F5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: child);
  }
}
