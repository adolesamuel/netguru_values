import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netguru_values/core/utils/list.dart';
import 'package:netguru_values/features/netguru/app/bloc/netguru_bloc.dart';
import 'package:netguru_values/features/netguru/app/pages/favourites_page.dart';
import 'package:netguru_values/features/netguru/app/widgets/text_display.dart';
import 'package:netguru_values/injection_container.dart';
import 'package:netguru_values/main.dart';

///Landing page showing display data
class NetGuruLandingPage extends StatefulWidget {
  const NetGuruLandingPage({Key? key}) : super(key: key);

  @override
  _NetGuruLandingPageState createState() => _NetGuruLandingPageState();
}

class _NetGuruLandingPageState extends State<NetGuruLandingPage>
    with TickerProviderStateMixin {
  List<String> defaultValues = AppList.values;
  List<String> valueToDisplay = [];
  late Animation<int> animation;
  late AnimationController controller;
  late int seconds;

  NetguruBloc ngBloc = sl<NetguruBloc>();

  @override
  void initState() {
    super.initState();
    ngBloc.add(GetMyValuesEvent());
    seconds = AppList.values.length * 3;
    controller =
        AnimationController(duration: Duration(seconds: seconds), vsync: this);
    animation =
        IntTween(begin: 0, end: defaultValues.length - 1).animate(controller)
          ..addListener(() {
            setState(() {});
          });

    controller.forward();
    controller.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NetguruBloc>(
      create: (context) => ngBloc,
      child: BlocConsumer<NetguruBloc, NetguruState>(
        listener: (context, state) {
          if (state is GetMyValuesResult) {
            valueToDisplay = [];
            valueToDisplay.addAll(defaultValues);
            valueToDisplay.addAll(state.values);
          }
        },
        builder: (context, state) {
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
                        return TextDisplay(
                            text: defaultValues[animation.value]);
                      },
                    ),
                  ),
                ),
                FavouritesPage(
                  activeValue: defaultValues[animation.value],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
