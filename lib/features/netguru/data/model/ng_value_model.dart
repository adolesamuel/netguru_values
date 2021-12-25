import 'dart:convert';

import 'package:netguru_values/features/netguru/domain/entities/ng_values.dart';

class NGValueModel extends NGValues {
  final String text;

  const NGValueModel({required this.text}) : super(text);

  factory NGValueModel.fromMap(Map map) {
    return NGValueModel(text: map['text']);
  }

  factory NGValueModel.fromJson(String jsonData) {
    final data = json.decode(jsonData);

    return NGValueModel(text: data['text']);
  }

  String toJson() {
    Map<String, String> mapObject = {
      'text': text,
    };

    return json.encode(mapObject);
  }
}
