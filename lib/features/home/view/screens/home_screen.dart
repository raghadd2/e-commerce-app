import 'package:base_project/core/routes/route_name.dart';
import 'package:base_project/core/utils/app_constance.dart';
import 'package:base_project/core/utils/app_extension.dart';
import 'package:base_project/core/utils/app_validation.dart';
import 'package:base_project/core/utils/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(context.tr.home),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              30.hGap,
              Consumer(
                builder: (context, ref, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DropdownButton<String>(
                        value: ref
                            .watch(langProvider), // Current selected language
                        items: [
                          DropdownMenuItem(
                            child: Text(AppConstance.arLang),
                            value: AppConstance.arLang,
                          ),
                          DropdownMenuItem(
                            child: Text(AppConstance.enLang),
                            value: AppConstance.enLang,
                          ),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            ref
                                .watch(langProvider.notifier)
                                .changeLanguage(value);
                          }
                        },
                      ),

                     
                    ],
                  );
                },
              ),
              100.hGap,
              Container(
                width: context.width,
                height: context.height * .12,
                color: Colors.blueGrey,
                child: Center(
                  child: Text(
                    context.tr.home,
                    style: context.text.displayLarge,
                  ),
                ),
              ),
              30.hGap,
              TextFormField(
                validator: (value) =>
                    AppValidation.fieldRequired(context, value ?? ""),
              ),
              30.hGap,
              ElevatedButton(
                onPressed: () {
                  context.pushNamed(NameRoutes.productNameRoute);
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ));
  }
}
