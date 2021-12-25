part of 'setting_bloc.dart';

abstract class SettingState extends Equatable {
  const SettingState();

  @override
  List<Object> get props => [];
}

class SettingInitial extends SettingState {}

class GetThemeError extends SettingState {
  final Failure failure;

  const GetThemeError(this.failure);
}

class GetThemeResult extends SettingState {
  final int value;

  const GetThemeResult(this.value);
}

class SaveThemeError extends SettingState {
  final Failure failure;

  const SaveThemeError(this.failure);
}

class SaveThemeResult extends SettingState {
  final int value;

  const SaveThemeResult(this.value);
}
