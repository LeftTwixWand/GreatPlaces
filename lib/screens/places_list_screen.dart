import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/places_provider.dart';
import './add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Your Places'),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
        body: FutureBuilder(
          future: Provider.of<PlacesProvider>(context, listen: false)
              .fetchAndSetPlaces(),
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Consumer<PlacesProvider>(
                      child: Center(
                        child: const Text('There are no places!'),
                      ),
                      builder: (ctx, placesProvider, myChild) =>
                          placesProvider.items.length <= 0
                              ? myChild as Widget
                              : ListView.builder(
                                  itemCount: placesProvider.items.length,
                                  itemBuilder: (ctx, index) => ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: FileImage(
                                        placesProvider.items[index].image,
                                      ),
                                    ),
                                    title: Text(
                                      placesProvider.items[index].title,
                                    ),
                                    onTap: () {},
                                  ),
                                ),
                    ),
        ),
      );
}
