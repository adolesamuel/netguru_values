import 'package:flutter/material.dart';

///Custom Text Widget for Displaying
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
          fontFamily: 'MoonDance', fontSize: 50, fontWeight: FontWeight.bold),
    );
  }
}
