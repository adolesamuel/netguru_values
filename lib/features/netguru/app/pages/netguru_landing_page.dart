import 'package:flutter/material.dart';
import 'package:netguru_values/core/utils/list.dart';
import 'package:netguru_values/main.dart';

class NetGuruLandingPage extends StatefulWidget {
  const NetGuruLandingPage({Key? key}) : super(key: key);

  @override
  _NetGuruLandingPageState createState() => _NetGuruLandingPageState();
}

class _NetGuruLandingPageState extends State<NetGuruLandingPage> {
  List<String> defaultValues = AppList.values;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NetGuru Values'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
          ),

          //Settings Icon
          IconButton(
              icon: Icon(MyApp.themeNotifier.value == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode),
              onPressed: () {
                MyApp.themeNotifier.value =
                    MyApp.themeNotifier.value == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light;
              })
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            defaultValues[2],
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 40.0,
            ),
          ),
        ),
      ),
      bottomSheet: BottomSheet(
        backgroundColor: Theme.of(context).primaryColor,
        onClosing: () {},
        builder: (context) {
          return const Icon(
            Icons.favorite,
            color: Colors.red,
            size: 100,
          );
        },
      ),
      persistentFooterButtons: [
        TextButton(onPressed: () {}, child: const Text('Values')),
        TextButton(onPressed: () {}, child: const Text('Add')),
      ],
    );
  }
}
