import 'package:flutter/material.dart';

class TextDisplay extends StatefulWidget {
  final String text;
  const TextDisplay({Key? key, required this.text}) : super(key: key);

  @override
  _TextDisplayState createState() => _TextDisplayState();
}

class _TextDisplayState extends State<TextDisplay> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 40.0,
      ),
    );
  }
}
