import 'package:equatable/equatable.dart';


class LoginModel extends Equatable{
  
  String password;

  LoginModel({required this.password});

factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    password: json["token"],
  );

  
  @override
  
  List<Object?> get props => [ password];
}
