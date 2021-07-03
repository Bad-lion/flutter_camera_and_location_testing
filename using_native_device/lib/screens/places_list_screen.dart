import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:using_native_device/providers/greate_places.dart';
import 'package:using_native_device/screens/add_screen.dart';
import 'package:using_native_device/screens/places_detail_screen.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your places"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routName);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future:
            Provider.of<GreatePlaces>(context, listen: false).fetchAndPlaces(),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<GreatePlaces>(
                    child: Center(
                      child: Text('Got not placing now, start adding some!'),
                    ),
                    builder: (ctx, greatePlaces, ch) =>
                        greatePlaces.items.length <= 0
                            ? ch
                            : ListView.builder(
                                itemCount: greatePlaces.items.length,
                                itemBuilder: (ctx, i) => GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        PlaceDetileScreen.routName,
                                        arguments: {
                                          'image': greatePlaces.items[i].image,
                                          'title': greatePlaces.items[i].title,
                                          'location':
                                              greatePlaces.items[i].location
                                        });
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 300,
                                        width: double.infinity,
                                        child: Image.file(
                                          greatePlaces.items[i].image,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Divider(),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                  ),
      ),
    );
  }
}

// ListTile(
//                                   leading: CircleAvatar(
//                                     backgroundImage: FileImage(
//                                       greatePlaces.items[i].image,
//                                     ),
//                                   ),
//                                   title: Text(greatePlaces.items[i].title),
//                                   onTap: () {Navigator.of(context).pushNamed(PlaceDetileScreen.routName, arguments: {
//                                     'image': greatePlaces.items[i].image,
//                                     'title': greatePlaces.items[i].title,
//                                     'location': greatePlaces.items[i].location
//                                   });},
//                                 ),
