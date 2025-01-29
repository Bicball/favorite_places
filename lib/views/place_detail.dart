import 'package:favorite_places/models/place.dart';
import 'package:flutter/material.dart';

class PlaceDetailView extends StatelessWidget{
  const PlaceDetailView({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.tittle),
      ),
      body: Center(child: Text(place.tittle, style: Theme
          .of(context).textTheme.bodyLarge!.copyWith(
          color: Theme.of(context).colorScheme.onSurface)),
      ),
    );
  }
}