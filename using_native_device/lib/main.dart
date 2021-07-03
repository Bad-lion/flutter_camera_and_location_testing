import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:using_native_device/screens/places_detail_screen.dart';
import './screens/add_screen.dart';
import 'package:using_native_device/screens/places_list_screen.dart';
import './providers/greate_places.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatePlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        home: PlacesListScreen(),
        routes: {
          AddPlaceScreen.routName: (ctx) => AddPlaceScreen(),
          PlaceDetileScreen.routName: (ctx) => PlaceDetileScreen(),
        },
      ),
    );
  }
}
