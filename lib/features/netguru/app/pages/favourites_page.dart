import 'package:flutter/material.dart';
import 'package:netguru_values/features/netguru/app/pages/add_values_page.dart';
import 'package:netguru_values/features/netguru/app/pages/values_list_page.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.15,
      minChildSize: 0.13,
      maxChildSize: 0.8,
      builder: (context, scrollController) {
        return Container(
          color: Theme.of(context)
              .scaffoldBackgroundColor
              .withOpacity(0.95)
              .withAlpha(200),
          child: ListView(
            controller: scrollController,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ValuesPage()));
                      },
                      child: const Text(
                        'Values',
                        style: TextStyle(fontSize: 20),
                      )),
                  const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 100,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddValuesPage()));
                      },
                      child: const Text(
                        'Add',
                        style: TextStyle(fontSize: 20),
                      )),
                ],
              ),
              const Center(
                  child: Text(
                'Favourites',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),
            ],
          ),
        );
      },
    );
  }
}
