import 'package:equatable/equatable.dart';
import 'package:netguru_values/features/netguru/domain/entities/ng_values.dart';

class NGValueParams extends Equatable {
  final NGValues value;

  const NGValueParams(this.value);
  @override
  List<Object?> get props => throw [value];
}
