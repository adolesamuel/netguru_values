import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netguru_values/features/netguru/app/bloc/netguru_bloc.dart';
import 'package:netguru_values/features/netguru/app/pages/favourites_page.dart';
import 'package:netguru_values/features/netguru/app/widgets/text_display.dart';
import 'package:netguru_values/injection_container.dart';
import 'package:netguru_values/main.dart';

///Landing page showing display data
class NetGuruLandingPage extends StatefulWidget {
  final List<String> valuesList;
  const NetGuruLandingPage({Key? key, required this.valuesList})
      : super(key: key);

  @override
  _NetGuruLandingPageState createState() => _NetGuruLandingPageState();
}

class _NetGuruLandingPageState extends State<NetGuruLandingPage>
    with TickerProviderStateMixin {
  //Animation that provides integer values for switching
  late Animation<int> animation;
  late AnimationController controller;
  late int seconds;

  NetguruBloc ngBloc = sl<NetguruBloc>();

  List<String> displayedList = [];

  @override
  void initState() {
    super.initState();
    displayedList = widget.valuesList;

    seconds = widget.valuesList.length * 5;
    controller =
        AnimationController(duration: Duration(seconds: seconds), vsync: this);
    animation = IntTween(begin: 0, end: widget.valuesList.length - 1)
        .animate(controller)
      ..addListener(() {
        setState(() {});
      });

    controller.forward();
    controller.repeat();
  }

  @override
  void didUpdateWidget(covariant NetGuruLandingPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    controller.dispose();

    displayedList = oldWidget.valuesList;

    seconds = oldWidget.valuesList.length * 3;
    controller =
        AnimationController(duration: Duration(seconds: seconds), vsync: this);
    animation = IntTween(begin: 0, end: oldWidget.valuesList.length - 1)
        .animate(controller)
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
            displayedList = [];
            displayedList.addAll(widget.valuesList);
            displayedList.add(state.values.last);
            didUpdateWidget(NetGuruLandingPage(valuesList: displayedList));
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('NetGuru Values'),
              elevation: 0,
              actions: [
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
                        //Main Text Widget here
                        return TextDisplay(
                            text: displayedList[animation.value]);
                      },
                    ),
                  ),
                ),
                //Draggable Scrollable Favourites page
                FavouritesPage(
                  activeValue: displayedList[animation.value],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
