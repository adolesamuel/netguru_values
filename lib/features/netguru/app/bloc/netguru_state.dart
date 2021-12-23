part of 'netguru_bloc.dart';

abstract class NetguruState extends Equatable {
  const NetguruState();
  
  @override
  List<Object> get props => [];
}

class NetguruInitial extends NetguruState {}
