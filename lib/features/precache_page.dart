import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netguru_values/core/utils/list.dart';
import 'package:netguru_values/features/netguru/app/bloc/netguru_bloc.dart';
import 'package:netguru_values/features/netguru/app/pages/netguru_landing_page.dart';
import 'package:netguru_values/injection_container.dart';

///This page is used to build dependencies before going to next page
class PreCachePage extends StatefulWidget {
  const PreCachePage({Key? key}) : super(key: key);

  @override
  _PreCachePageState createState() => _PreCachePageState();
}

class _PreCachePageState extends State<PreCachePage> {
  List<String> defaultValue = AppList.values;
  List<String> valueToDisplay = [];

  NetguruBloc ngBloc = sl<NetguruBloc>();

  @override
  void initState() {
    super.initState();
    ngBloc.add(GetMyValuesEvent());
    valueToDisplay.addAll(defaultValue);
  }

  @override
  void dispose() {
    super.dispose();
    ngBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NetguruBloc>(
      create: (context) => ngBloc,
      child: BlocConsumer<NetguruBloc, NetguruState>(
        listener: (context, state) {
          if (state is GetMyValuesResult) {
            valueToDisplay.addAll(state.values);
          }
        },
        builder: (context, state) {
          if (state is GetMyValuesResult) {
            return NetGuruLandingPage(valuesList: valueToDisplay);
          } else {
            return const Scaffold(
                body: Center(child: CircularProgressIndicator()));
          }
        },
      ),
    );
  }
}
