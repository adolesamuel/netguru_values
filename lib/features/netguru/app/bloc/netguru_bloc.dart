import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:netguru_values/core/failures/failure.dart';
import 'package:netguru_values/core/usecase/usecase.dart';
import 'package:netguru_values/features/netguru/domain/usecases/add_to_favorites.dart';
import 'package:netguru_values/features/netguru/domain/usecases/add_to_values.dart';
import 'package:netguru_values/features/netguru/domain/usecases/get_favorites.dart';
import 'package:netguru_values/features/netguru/domain/usecases/get_my_values.dart';
import 'package:netguru_values/features/netguru/domain/usecases/ng_params.dart';
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
    on<NetguruEvent>(_onEvent);
  }

  _onEvent(NetguruEvent event, Emitter<NetguruState> emit) async {
    if (event is GetMyValuesEvent) {
      final getMyValuesOrError = await getMyValues(NoParams());

      emit(getMyValuesOrError.fold(
          (l) => GetMyValuesFailure(l), (r) => GetMyValuesResult(r)));
    } else if (event is AddToValuesEvent) {
      emit(AddToValueLoading());

      final addToValueOrError = await addToValues(NGValueParams(event.value));

      emit(addToValueOrError.fold(
          (l) => AddToValueFailure(l), (r) => AddToValueResult(r)));
    } else if (event is AddToFavouritesEvent) {
      emit(AddToFavouritesLoading());

      final addToValueOrError =
          await addToFavourites(NGValueParams(event.value));

      emit(addToValueOrError.fold(
          (l) => AddToFavouritesFailure(l), (r) => AddToFavouritesResult(r)));
    } else if (event is GetFavouritesEvent) {
      final getMyValuesOrError = await getFavourites(NoParams());

      emit(getMyValuesOrError.fold(
          (l) => GetFavouritesFailure(l), (r) => GetFavouritesResult(r)));
    } else if (event is RemoveFromFavouritesEvent) {
      final removeFromFavouritesOrError =
          await removeFromFavourites(NGValueParams(event.value));

      emit(removeFromFavouritesOrError.fold((l) => RemoveFromFavouritesError(l),
          (r) => RemoveFromFavouritesResult(r)));
    }
  }
}
