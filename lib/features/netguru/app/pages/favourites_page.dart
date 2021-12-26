import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netguru_values/features/netguru/app/bloc/netguru_bloc.dart';
import 'package:netguru_values/features/netguru/app/pages/add_values_page.dart';
import 'package:netguru_values/features/netguru/app/pages/values_list_page.dart';
import 'package:netguru_values/features/netguru/app/widgets/favourite_list_item.dart';

class FavouritesPage extends StatefulWidget {
  final String activeValue;
  const FavouritesPage({
    Key? key,
    required this.activeValue,
  }) : super(key: key);

  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  late NetguruBloc ngBloc;

  List<String> listToDisplay = [];

  @override
  void initState() {
    super.initState();
    ngBloc = BlocProvider.of<NetguruBloc>(context);
    ngBloc.add(GetFavouritesEvent());
  }

  ///This is what the big red button does on the favourite page
  void saveOrRemoveFromFavourites() {
    if (listToDisplay.contains(widget.activeValue)) {
      ngBloc.add(RemoveFromFavouritesEvent(widget.activeValue));
    } else {
      ngBloc.add(AddToFavouritesEvent(widget.activeValue));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NetguruBloc>(
      create: (context) => ngBloc,
      child: BlocConsumer<NetguruBloc, NetguruState>(
        listener: (context, state) {
          if (state is GetFavouritesResult) {
            listToDisplay = state.values;
          } else if (state is AddToFavouritesResult) {
            ngBloc.add(GetFavouritesEvent());
          } else if (state is RemoveFromFavouritesResult) {
            ngBloc.add(GetFavouritesEvent());
          }
        },
        builder: (context, state) {
          return DraggableScrollableSheet(
            initialChildSize: 0.15,
            minChildSize: 0.13,
            maxChildSize: 0.8,
            builder: (context, scrollController) {
              return Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                height: MediaQuery.of(context).size.height,
                child: CustomScrollView(
                  controller: scrollController,
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      snap: false,
                      floating: false,
                      expandedHeight: 150.0,
                      collapsedHeight: 150.0,
                      flexibleSpace: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //Values page button
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ValuesPage()));
                                  },
                                  child: const Text(
                                    'Values',
                                    style: TextStyle(fontSize: 18),
                                  )),

                              //big like button
                              IconButton(
                                onPressed: saveOrRemoveFromFavourites,
                                icon: Icon(
                                  Icons.favorite,
                                  color:
                                      listToDisplay.contains(widget.activeValue)
                                          ? Colors.red
                                          : Colors.grey,
                                ),
                                iconSize: 100.0,
                              ),

                              //add New Button
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const AddValuesPage()));
                                  },
                                  child: const Text(
                                    'Add',
                                    style: TextStyle(fontSize: 18),
                                  )),
                            ],
                          ),
                          const Center(
                              child: Text(
                            'Favourites',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )),
                        ],
                      ),
                    ),
                    SliverList(
                        delegate: SliverChildListDelegate([
                      ListView.separated(
                          primary: false,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return FavouriteListItem(
                                value: listToDisplay[index]);
                          },
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: listToDisplay.length),
                    ])),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
