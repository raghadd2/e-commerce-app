import 'package:base_project/features/dashboard/view/widgets/navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key, required this.navigatorShellKey});
  final StatefulNavigationShell navigatorShellKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const NavBarWidget(),
      body: navigatorShellKey,
    );
  }
}
