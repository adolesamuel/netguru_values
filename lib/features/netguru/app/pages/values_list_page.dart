import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netguru_values/core/utils/list.dart';
import 'package:netguru_values/features/netguru/app/bloc/netguru_bloc.dart';
import 'package:netguru_values/injection_container.dart';

class ValuesPage extends StatefulWidget {
  const ValuesPage({Key? key}) : super(key: key);

  @override
  _ValuesPageState createState() => _ValuesPageState();
}

class _ValuesPageState extends State<ValuesPage> {
  NetguruBloc ngBloc = sl<NetguruBloc>();
  List<String> valuesToDisplay = [];

  @override
  void initState() {
    super.initState();
    ngBloc.add(GetMyValuesEvent());
    valuesToDisplay.addAll(AppList.values);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NetguruBloc>(
      create: (context) => ngBloc,
      child: BlocConsumer<NetguruBloc, NetguruState>(
        listener: (context, state) {
          if (state is GetMyValuesResult) {
            valuesToDisplay.addAll(state.values);
          }
        },
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: const Text('Values'),
                elevation: 0,
              ),
              body: ListView.builder(
                  itemCount: valuesToDisplay.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text((index + 1).toString()),
                      title: Text(valuesToDisplay[index]),
                    );
                  }));
        },
      ),
    );
  }
}
