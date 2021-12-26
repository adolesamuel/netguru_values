import 'package:flutter/material.dart';

class AddValuesPage extends StatefulWidget {
  const AddValuesPage({Key? key}) : super(key: key);

  @override
  _AddValuesPageState createState() => _AddValuesPageState();
}

class _AddValuesPageState extends State<AddValuesPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Add to values page'),
      ),
    );
  }
}
