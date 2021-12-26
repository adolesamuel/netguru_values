import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netguru_values/features/netguru/app/bloc/netguru_bloc.dart';
import 'package:netguru_values/features/netguru/app/pages/add_values_page.dart';
import 'package:netguru_values/features/netguru/app/pages/values_list_page.dart';
import 'package:netguru_values/injection_container.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  NetguruBloc ngBloc = sl<NetguruBloc>();

  List<String> favouriteList = [
    'Faves',
    'Faves',
    'Faves',
    'Faves',
    'Faves',
    'Faves',
    'Faves',
    'Faves',
    'Faves',
    'Faves',
    'Faves',
    'Faves',
    'Faves',
    'Faves',
    'Faves',
    'Faves',
    'Faves',
    'Faves',
    'Faves',
    'Faves',
    'Faves',
  ];

  @override
  void initState() {
    super.initState();
    ngBloc.add(GetFavouritesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NetguruBloc>(
      create: (context) => ngBloc,
      child: BlocConsumer<NetguruBloc, NetguruState>(
        listener: (context, state) {
          if (state is GetFavouritesResult) {
            favouriteList.addAll(state.values);
          }
          if (state is AddToFavouritesResult) {
            favouriteList.add(state.values.last);
          }
        },
        builder: (context, state) {
          return DraggableScrollableSheet(
            initialChildSize: 0.15,
            minChildSize: 0.13,
            maxChildSize: 0.8,
            builder: (context, scrollController) {
              return Container(
                color: Colors.blue,
                // Theme.of(context)
                //     .scaffoldBackgroundColor
                //     .withOpacity(0.95)
                //     .withAlpha(200),
                height: MediaQuery.of(context).size.height,
                child: CustomScrollView(
                  controller: scrollController,
                  slivers: [
                    SliverAppBar(
                      backgroundColor: Colors.blue,
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
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
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
                      // const SizedBox(
                      //   height: 50.0,
                      // ),

                      ListView.separated(
                          primary: false,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(favouriteList[index]),
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: favouriteList.length),
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
