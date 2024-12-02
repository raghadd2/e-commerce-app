import 'package:base_project/core/utils/app_extension.dart';
import 'package:base_project/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class NavBarItemWidget extends StatelessWidget {
  const NavBarItemWidget(
      {super.key,
      required this.icon,
      required this.isSelected,
      required this.onTap}
    );
  final IconData icon;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
         Icon(icon,
              color:
                isSelected ? AppColors.primaryColor : Color(0xff6D7E7A),

              ),
          3.hGap,
         
        ],
      ),
    );
  }
}
