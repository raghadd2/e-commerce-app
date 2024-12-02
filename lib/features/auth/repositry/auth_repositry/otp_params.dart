
import 'package:equatable/equatable.dart';

class OtpParmas extends Equatable {
  final String code;
  

  OtpParmas({required this.code});

  tojsin() {
    return {
      "code": code,
    };
  }

  @override
  List<Object?> get props => [code];
}
