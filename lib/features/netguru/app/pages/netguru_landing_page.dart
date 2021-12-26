import 'package:flutter/material.dart';
import 'package:netguru_values/core/utils/list.dart';
import 'package:netguru_values/features/netguru/app/pages/favourites_page.dart';
import 'package:netguru_values/features/netguru/app/widgets/text_display.dart';
import 'package:netguru_values/main.dart';

class NetGuruLandingPage extends StatefulWidget {
  const NetGuruLandingPage({Key? key}) : super(key: key);

  @override
  _NetGuruLandingPageState createState() => _NetGuruLandingPageState();
}

class _NetGuruLandingPageState extends State<NetGuruLandingPage>
    with TickerProviderStateMixin {
  List<String> defaultValues = AppList.values;
  late Animation<int> animation;
  late AnimationController controller;
  late int seconds;
  late AnimationController fadeController;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();
    seconds = AppList.values.length * 3;
    controller =
        AnimationController(duration: Duration(seconds: seconds), vsync: this);
    animation =
        IntTween(begin: 0, end: defaultValues.length - 1).animate(controller)
          ..addListener(() {
            setState(() {});
          });

    fadeController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    fadeAnimation = Tween<double>(begin: 0.0, end: 1).animate(fadeController)
      ..addListener(() {
        setState(() {});
      });

    controller.forward();
    controller.repeat();
    fadeController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

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
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, _) {
                  return Text(
                    defaultValues[animation.value],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 40.0,
                    ),
                  );
                },
              ),
            ),
          ),
          const FavouritesPage(),
        ],
      ),
    );
  }
}
