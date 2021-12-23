import 'package:equatable/equatable.dart';

class NGValues extends Equatable {
  final String text;

  const NGValues(this.text);

  @override
  List<Object?> get props => [text];
}
