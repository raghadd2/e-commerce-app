import 'package:equatable/equatable.dart';

class LoginParmas extends Equatable {
  final String phone;
  

  LoginParmas({required this.phone});

  tojsin() {
    return {
      "phone": phone,
    };
  }

  @override
  List<Object?> get props => [phone];
}
