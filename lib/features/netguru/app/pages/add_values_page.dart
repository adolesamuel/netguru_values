import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netguru_values/features/netguru/app/bloc/netguru_bloc.dart';
import 'package:netguru_values/injection_container.dart';

class AddValuesPage extends StatefulWidget {
  const AddValuesPage({Key? key}) : super(key: key);

  @override
  _AddValuesPageState createState() => _AddValuesPageState();
}

class _AddValuesPageState extends State<AddValuesPage> {
  TextEditingController textController = TextEditingController();
  FocusNode textFocusNode = FocusNode();
  bool isEmpty = false;

  NetguruBloc ngBloc = sl<NetguruBloc>();

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
    textFocusNode.dispose();
  }

  void saveText() {
    if (textController.text.isNotEmpty) {
      textFocusNode.unfocus();

      ngBloc.add(AddToValuesEvent(textController.text));
    } else {
      isEmpty = true;

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NetguruBloc>(
      create: (context) => ngBloc,
      child: BlocConsumer<NetguruBloc, NetguruState>(
        listener: (context, state) {
          if (state is AddToValueResult) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                'Value Added Successfully!',
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
            ));

            textController.clear();
          }
        },
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: const Text('Add To Values Page'),
                elevation: 0,
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextField(
                      controller: textController,
                      focusNode: textFocusNode,
                      textCapitalization: TextCapitalization.sentences,
                      maxLines: 5,
                      onChanged: (text) {
                        isEmpty = false;
                        setState(() {});
                      },
                      decoration: InputDecoration(
                          hintText: 'Enter an interesting value',
                          hintStyle:
                              const TextStyle(fontStyle: FontStyle.italic),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          errorText: isEmpty
                              ? 'Please Enter A Value you cherish!'
                              : null,
                          errorStyle:
                              const TextStyle(fontStyle: FontStyle.italic)),
                    ),
                    //one more widget to position items beautifully
                    const SizedBox(
                      height: 8.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        //do the add to stuff event here
                        saveText();
                      },
                      child: const Text('Save Value'),
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.resolveWith((state) {
                        if (state.contains(MaterialState.pressed)) {
                          return 0;
                        } else {
                          return 6.0;
                        }
                      })),
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }
}
