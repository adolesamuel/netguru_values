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

class AddToValueLoading extends NetguruState {}

class AddToValueFailure extends NetguruState {
  final Failure failure;

  const AddToValueFailure(this.failure);
}

class AddToValueResult extends NetguruState {
  final List<String> values;

  const AddToValueResult(this.values);
}

class AddToFavouritesLoading extends NetguruState {}

class AddToFavouritesFailure extends NetguruState {
  final Failure failure;

  const AddToFavouritesFailure(this.failure);
}

class AddToFavouritesResult extends NetguruState {
  final List<String> values;

  const AddToFavouritesResult(this.values);
}

class GetFavouritesFailure extends NetguruState {
  final Failure failure;

  const GetFavouritesFailure(this.failure);
}

class GetFavouritesResult extends NetguruState {
  final List<String> values;

  const GetFavouritesResult(this.values);
}

class RemoveFromFavouritesError extends NetguruState {
  final Failure failure;

  const RemoveFromFavouritesError(this.failure);
}

class RemoveFromFavouritesResult extends NetguruState {
  final List<String> values;

  const RemoveFromFavouritesResult(this.values);
}
