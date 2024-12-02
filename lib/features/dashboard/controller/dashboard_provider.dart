import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardProvider = NotifierProvider<DashboardProvider, int>(() {
  return DashboardProvider();
});

class DashboardProvider extends Notifier<int> {
  @override
  int build() => 0;

  void changeIndex(int index) {
    state = index;
  }
}
