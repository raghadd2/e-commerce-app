import 'package:base_project/generated/l10n.dart';
import 'package:flutter/material.dart';

extension SpacingExtension on num {
  Widget get hGap => SizedBox(height: toDouble());
  Widget get wGap => SizedBox(width: toDouble());
}

extension BorderRadiusExtension on num {
  BorderRadius get radius => BorderRadius.circular(toDouble());
  BorderRadius get topCorRadius => BorderRadius.only(
        topLeft: Radius.circular(toDouble()),
        topRight: Radius.circular(toDouble()),
      );
  BorderRadius get bottomCorRadius => BorderRadius.only(
        bottomLeft: Radius.circular(toDouble()),
        bottomRight: Radius.circular(toDouble()),
      );
}

extension PaddingExtension on num {
  EdgeInsets get allPad => EdgeInsets.all(toDouble());
  EdgeInsets get syPad =>
      EdgeInsets.symmetric(horizontal: toDouble(), vertical: toDouble());
  EdgeInsets get horPad => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get verPad => EdgeInsets.symmetric(vertical: toDouble());
  EdgeInsets get topPad => EdgeInsets.only(top: toDouble());
  EdgeInsets get bottomPad => EdgeInsets.only(bottom: toDouble());
  EdgeInsets get leftPad => EdgeInsets.only(left: toDouble());
  EdgeInsets get rightPad => EdgeInsets.only(right: toDouble());
}

extension ContextExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  TextTheme get text => Theme.of(this).textTheme;
  ThemeData get theme => Theme.of(this);
  String get locale => Localizations.localeOf(this).languageCode;
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
  S get tr => S.of(this);
}

extension ParserExtension on String {
  int get parseInt => int.parse(this);
  double get parseDouble => double.parse(this);
}

extension DurationExtension on int {
  Duration get seconds => Duration(seconds: this);
  Duration get minutes => Duration(minutes: this);
  Duration get hours => Duration(hours: this);
  Duration get days => Duration(days: this);
}
