import 'package:base_project/core/routes/route_name.dart';
import 'package:base_project/core/utils/app_extension.dart';
import 'package:base_project/core/utils/app_validation.dart';
import 'package:base_project/core/utils/theme/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: 22.horPad,
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(AppImages.loginImg),
                24.hGap,
                Text('تسجيل الدخول',
                    style: context.text.headlineMedium!
                        .copyWith(color: Colors.white)),
                8.hGap,
                Text(
                  'اهلا بك في تطبيق المراقب',
                  style: context.text.bodyMedium!.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                24.hGap,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      textInputAction: TextInputAction.done,
                      validator: (value) => AppValidation.validatePhoneNumber(
                          context, value ?? ""),
                      decoration: InputDecoration(
                        fillColor: Colors.grey[200],
                        hintText: 'رقم الهاتف',
                        suffixIcon: Icon(Icons.phone, color: Colors.grey),
                      ),
                    ),
                    20.hGap,
                    ElevatedButton(
                      onPressed: () {
                        context.goNamed(NameRoutes.otpNameRoute);
                      },
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
