import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favorite_places/models/place.dart';

class UserPlacesNotifier extends StateNotifier<List<Place>>{
  UserPlacesNotifier() : super(const []);

  void addPlace(String tittle, File image){
    final newPlace = Place(tittle: tittle, image: image);
    state = [newPlace, ...state];
  }
}

final userPlacesProvider = StateNotifierProvider<UserPlacesNotifier, List<Place>>(
      (ref) => UserPlacesNotifier(),
);
