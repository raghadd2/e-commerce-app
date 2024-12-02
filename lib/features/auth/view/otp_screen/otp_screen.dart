import 'package:base_project/core/routes/route_name.dart';
import 'package:base_project/core/utils/app_extension.dart';
import 'package:base_project/core/utils/theme/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImages.loginImg),
              30.hGap,
              Text(
                "تسجيل الدخول",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.black87)
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              5.hGap,
              Pinput(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء ادخال رمز التحقق';
                  }
                  return null;
                },
                length: 4,
                autofocus: true,
                defaultPinTheme: PinTheme(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: 60,
                  height: 60,
                ),
              ),
              10.hGap,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "لم يصلك رمز التحقق؟",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Text(
                    "اعادة المحاولة",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
              5.hGap,
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    context.goNamed(NameRoutes.productNameRoute);
                  },
                  child: Text(
                    "تأكد من الرمز",
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
