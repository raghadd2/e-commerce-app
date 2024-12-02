import 'package:base_project/core/utils/app_constance.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class PaginationResponse<T> extends Equatable {
  List<T> items;
  final int? totalPages;
  final int page;
  PaginationResponse({
    required this.items,
    this.totalPages,
    this.page = AppConstance.page,
  });

  factory PaginationResponse.fromJson(Map<String, dynamic> json) =>
      PaginationResponse(
        items: const [],
        page: json['key'] ?? AppConstance.page,
        totalPages: json['kay'],
      );

  @override
  List<Object?> get props {
    return [
      items,
      totalPages,
      page,
    ];
  }
}
