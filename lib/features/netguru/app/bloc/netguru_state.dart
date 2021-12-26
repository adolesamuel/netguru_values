part of 'netguru_bloc.dart';

abstract class NetguruState extends Equatable {
  const NetguruState();

  @override
  List<Object> get props => [];
}

class NetguruInitial extends NetguruState {}

class GetMyValuesFailure extends NetguruState {
  final Failure failure;

  const GetMyValuesFailure(this.failure);
}

class GetMyValuesResult extends NetguruState {
  final List<String> values;

  const GetMyValuesResult(this.values);
}
