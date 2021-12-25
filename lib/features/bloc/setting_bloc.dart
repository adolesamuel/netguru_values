import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:netguru_values/core/failures/failure.dart';
import 'package:netguru_values/core/usecase/usecase.dart';
import 'package:netguru_values/features/netguru/domain/usecases/get_theme.dart';
import 'package:netguru_values/features/netguru/domain/usecases/save_theme.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  final SaveTheme saveTheme;
  final GetTheme getTheme;
  SettingBloc({
    required this.saveTheme,
    required this.getTheme,
  }) : super(SettingInitial()) {
    on<SettingEvent>(_onEvent);
  }

  _onEvent(SettingEvent event, Emitter<SettingState> emit) async {
    if (event is GetThemeEvent) {
      final getThemeOrError = await getTheme(NoParams());

      emit(getThemeOrError.fold(
          (l) => GetThemeError(l), (r) => GetThemeResult(r)));
    } else if (event is SaveThemeEvent) {
      final saveThemeOrError = await saveTheme(SaveThemeParams(event.value));

      emit(saveThemeOrError.fold(
          (l) => SaveThemeError(l), (r) => SaveThemeResult(r)));
    }
  }
}
