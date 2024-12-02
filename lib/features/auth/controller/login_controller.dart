import 'package:base_project/core/routes/route_name.dart';
import 'package:base_project/core/utils/enums/request_state.dart';
import 'package:base_project/core/utils/general_state.dart';
import 'package:base_project/core/utils/public_methods.dart';
import 'package:base_project/features/auth/repositry/auth_repositry/auth_repositry.dart';
import 'package:base_project/features/auth/repositry/auth_repositry/product_params.dart';
import 'package:base_project/features/auth/repositry/auth_repositry/otp_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final loginprovider = ChangeNotifierProvider((ref) {
  return Login_Notifier();
});

class Login_Notifier extends ChangeNotifier {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final loginRepositry = AuthenticationRepositry();
  final otpRepositry = AuthenticationRepositry();
  var genstate = GeneralState(requestState: RequestState.empty);
  var key = GlobalKey<FormState>();

  login(BuildContext context) async {
    if (!key.currentState!.validate()) return;
    changeState(RequestState.loading);
    final result =
        await loginRepositry.login(LoginParmas(phone: phoneController.text));
    result.fold((error) {
      PublicMethods.displaySnackBar(context: context, message: error);
      genstate = GeneralState(requestState: RequestState.error, message: error);
    }, (data) {
      genstate = GeneralState(requestState: RequestState.loaded);
      context.pushNamed(NameRoutes.otpNameRoute);
    });
    notifyListeners();
  }

  checkOtp(BuildContext context) async {
    if (!key.currentState!.validate()) return;
    changeState(RequestState.loading);
    final result =
        await otpRepositry.checkOtp(OtpParmas(code: otpController.text));
    result.fold((error) {
      PublicMethods.displaySnackBar(context: context, message: error);
      print(error);
      genstate = GeneralState(requestState: RequestState.error, message: error);
    }, (data) {
      genstate = GeneralState(requestState: RequestState.loaded);
      context.pushNamed(NameRoutes.productNameRoute);
    });
    notifyListeners();
  }

  void changeState(RequestState requestState) {
    genstate = GeneralState(requestState: requestState);
    notifyListeners();
  }
}
