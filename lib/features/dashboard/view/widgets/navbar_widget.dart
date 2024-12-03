import 'package:base_project/core/routes/route_name.dart';
import 'package:base_project/features/dashboard/controller/dashboard_provider.dart';
import 'package:base_project/features/dashboard/view/widgets/navbar_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class NavBarWidget extends ConsumerWidget {
  const NavBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(dashboardProvider);
    return Container(
      // color: Color(0xff053262),
      height: 60,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey,
              width: 0.3,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavBarItemWidget(
              icon: Icons.home_outlined,
              isSelected: index == 0,
              onTap: () {
                if (index == 0) return;
                ref.watch(dashboardProvider.notifier).changeIndex(0);
                context.goNamed(NameRoutes.productNameRoute);
              },
            ),
            NavBarItemWidget(
              icon: Icons.search_outlined,
              isSelected: index == 1,
              onTap: () {
                if (index == 1) return;
                ref.watch(dashboardProvider.notifier).changeIndex(1);
                context.goNamed(NameRoutes.searchNameRoute);
              },
            ),
            NavBarItemWidget(
              icon: Icons.settings_outlined,
              onTap: () {
                if (index == 2) return;

                ref.watch(dashboardProvider.notifier).changeIndex(2);
                context.goNamed(NameRoutes.settingsNameRoute);
              },
              isSelected: index == 2,
            ),
          ],
        ),
      ),
    );
  }
}
