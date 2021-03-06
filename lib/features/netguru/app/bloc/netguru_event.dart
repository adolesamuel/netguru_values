part of 'netguru_bloc.dart';

abstract class NetguruEvent extends Equatable {
  const NetguruEvent();

  @override
  List<Object> get props => [];
}

class GetMyValuesEvent extends NetguruEvent {}

class AddToValuesEvent extends NetguruEvent {
  final String value;

  const AddToValuesEvent(this.value);
}

class AddToFavouritesEvent extends NetguruEvent {
  final String value;

  const AddToFavouritesEvent(this.value);
}

class GetFavouritesEvent extends NetguruEvent {}

class RemoveFromFavouritesEvent extends NetguruEvent {
  final String value;

  const RemoveFromFavouritesEvent(this.value);
}

class RemoveFromValuesEvent extends NetguruEvent {
  final String value;

  const RemoveFromValuesEvent(this.value);
}
