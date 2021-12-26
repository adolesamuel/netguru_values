import 'package:equatable/equatable.dart';
import 'package:netguru_values/features/netguru/domain/repository/ng_value_repository.dart';

class SaveTheme {
  final NGValueRepository ngValueRepository;

  SaveTheme(this.ngValueRepository);

  Future<int> value(SaveThemeParams params) async {
    return await ngValueRepository.saveTheme(params.value);
  }
}

class SaveThemeParams extends Equatable {
  /// the theme value is saved as int
  /// 0 is for system,
  /// 1 is for light mode,
  /// 2 is for dark mode.
  final int value;

  const SaveThemeParams(this.value);

  @override
  List<Object?> get props => [value];
}
