import 'package:equatable/equatable.dart';
import 'package:netguru_values/features/netguru/data/model/ng_value_model.dart';

class NGValues extends Equatable {
  final String text;

  const NGValues(this.text);

  NGValueModel toValueModel() {
    return NGValueModel(text: text);
  }

  @override
  List<Object?> get props => [text];
}
