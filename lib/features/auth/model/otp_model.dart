
import 'package:equatable/equatable.dart';

class OtpModel extends Equatable {
  final String code;

  OtpModel({required this.code});

  factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
        code: json["token"],
      );

  @override
  List<Object?> get props => [code];
}