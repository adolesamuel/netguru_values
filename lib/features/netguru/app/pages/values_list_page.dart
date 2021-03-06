import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netguru_values/core/utils/list.dart';
import 'package:netguru_values/features/netguru/app/bloc/netguru_bloc.dart';
import 'package:netguru_values/injection_container.dart';

///Page for showing list of values
class ValuesPage extends StatefulWidget {
  const ValuesPage({Key? key}) : super(key: key);

  @override
  _ValuesPageState createState() => _ValuesPageState();
}

class _ValuesPageState extends State<ValuesPage> {
  NetguruBloc ngBloc = sl<NetguruBloc>();
  List<String> valuesToDisplay = [];
  List<String> myValues = [];

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
            valuesToDisplay = [];
            myValues = state.values;
            valuesToDisplay.addAll(AppList.values);
            valuesToDisplay.addAll(myValues);
          } else if (state is RemoveFromValuesResult) {
            ngBloc.add(GetMyValuesEvent());
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
                      trailing:
                          //Code to only show remove button on saved values
                          myValues.contains(valuesToDisplay[index])
                              ? IconButton(
                                  icon: const Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    ngBloc.add(RemoveFromValuesEvent(
                                        valuesToDisplay[index]));
                                  },
                                )
                              : null,
                    );
                  }));
        },
      ),
    );
  }
}
