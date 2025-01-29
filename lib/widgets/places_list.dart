import 'package:favorite_places/views/place_detail.dart';
import 'package:flutter/material.dart';
import 'package:favorite_places/models/place.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text('No places yet!',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface),
        ),
      );
    }
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (ctx, index) =>
          ListTile(
            title: Text(places[index].tittle, style: Theme
                .of(context)
                .textTheme
                .titleMedium!
                .copyWith(
                color: Theme
                    .of(context)
                    .colorScheme
                    .onSurface),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => PlaceDetailView(place: places[index])
              ));
            },
          ),
    );
  }
}