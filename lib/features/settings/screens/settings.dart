import 'package:base_project/core/routes/route_name.dart';
import 'package:base_project/core/utils/app_constance.dart';
import 'package:base_project/core/utils/app_extension.dart';
import 'package:base_project/core/utils/language_provider.dart';
import 'package:base_project/features/settings/widget/setting_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(context.tr.settings),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Consumer(builder: (context, ref, child) {
                return Settings_widget(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(context.tr.language,
                          style: TextStyle(
                            fontSize: 17,
                            color: Color(0xff053262),
                          )),
                      DropdownButton<String>(
                        isDense: true,
                        underline: Container(),
                        value: ref.watch(langProvider),
                        items: [
                          DropdownMenuItem(
                            child: Text('العربية'),
                            value: AppConstance.arLang,
                          ),
                          DropdownMenuItem(
                            child: Text('English'),
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
                  ),
                );
              }),
              20.hGap,
              Settings_widget(
                child: InkWell(
                    onTap: () {
                      context.pushNamed(NameRoutes.faqNameRoute);
                    },
                    child: Text(context.tr.faq,
                        style:
                            TextStyle(color: Color(0xff053262), fontSize: 17))),
              ),
              20.hGap,
              Settings_widget(
                  child: Text(context.tr.myOrders,
                      style:
                          TextStyle(color: Color(0xff053262), fontSize: 17))),
              20.hGap,
              Settings_widget(
                  child: Text(context.tr.privacyPolicy,
                      style:
                          TextStyle(color: Color(0xff053262), fontSize: 17))),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
            child: ElevatedButton(
          onPressed: () {},
          child: Text(context.tr.logout),
        )));
  }
}
