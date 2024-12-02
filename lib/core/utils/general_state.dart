import 'package:base_project/core/utils/enums/request_state.dart';
import 'package:equatable/equatable.dart';

class GeneralState<T> extends Equatable {
  final RequestState requestState;
  final T? data;
  final String message;

  const GeneralState(
      {this.data, this.requestState = RequestState.loading, this.message = ""});

  @override
  List<Object?> get props => [requestState, message, data];
}
