part of 'setting_bloc.dart';

abstract class SettingEvent extends Equatable {
  const SettingEvent();

  @override
  List<Object> get props => [];
}

class GetThemeEvent extends SettingEvent {}

class SaveThemeEvent extends SettingEvent {
  final int value;

  const SaveThemeEvent(this.value);
}
