import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:netguru_values/features/netguru/domain/usecases/add_to_favorites.dart';
import 'package:netguru_values/features/netguru/domain/usecases/add_to_values.dart';
import 'package:netguru_values/features/netguru/domain/usecases/get_favorites.dart';
import 'package:netguru_values/features/netguru/domain/usecases/get_my_values.dart';
import 'package:netguru_values/features/netguru/domain/usecases/remove_from_favorites.dart';
import 'package:netguru_values/features/netguru/domain/usecases/remove_from_values.dart';

part 'netguru_event.dart';
part 'netguru_state.dart';

class NetguruBloc extends Bloc<NetguruEvent, NetguruState> {
  final AddToFavourites addToFavourites;
  final AddToValues addToValues;
  final GetFavourites getFavourites;
  final GetMyValues getMyValues;
  final RemoveFromFavourites removeFromFavourites;
  final RemoveFromValues removeFromValues;

  NetguruBloc({
    required this.addToFavourites,
    required this.addToValues,
    required this.getFavourites,
    required this.getMyValues,
    required this.removeFromFavourites,
    required this.removeFromValues,
  }) : super(NetguruInitial()) {
    on<NetguruEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
