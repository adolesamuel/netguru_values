import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netguru_values/features/netguru/app/bloc/netguru_bloc.dart';

class FavouriteListItem extends StatefulWidget {
  final String value;
  const FavouriteListItem({Key? key, required this.value}) : super(key: key);

  @override
  _FavouriteListItemState createState() => _FavouriteListItemState();
}

class _FavouriteListItemState extends State<FavouriteListItem> {
  late NetguruBloc ngBloc;

  @override
  void initState() {
    super.initState();

    ngBloc = BlocProvider.of<NetguruBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.value),
      trailing: IconButton(
        icon: const Icon(
          Icons.cancel,
          color: Colors.red,
        ),
        onPressed: () {
          ngBloc.add(RemoveFromFavouritesEvent(widget.value));
        },
      ),
    );
  }
}
