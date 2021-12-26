import 'package:flutter/material.dart';

class ValuesPage extends StatefulWidget {
  const ValuesPage({Key? key}) : super(key: key);

  @override
  _ValuesPageState createState() => _ValuesPageState();
}

class _ValuesPageState extends State<ValuesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Values Page'),
      ),
    );
  }
}
