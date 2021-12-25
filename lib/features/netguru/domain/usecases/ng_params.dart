import 'package:equatable/equatable.dart';

class NGValueParams extends Equatable {
  final String value;

  const NGValueParams(this.value);
  @override
  List<Object?> get props => throw [value];
}
