import 'dart:io';
import 'package:favorite_places/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favorite_places/providers/user_places.dart';
import 'package:favorite_places/widgets/image_input.dart';



class AddPlaceView extends ConsumerStatefulWidget{
  const AddPlaceView({super.key});

  @override
  ConsumerState<AddPlaceView> createState() {
    return _AddPlaceViewState();
  }
}

class _AddPlaceViewState extends ConsumerState<AddPlaceView>{
  final _tittleController = TextEditingController();
  File? _selectedImage;

  void _savePlace(){
    final enteredTittle = _tittleController.text;
    if(enteredTittle.isEmpty || _selectedImage == null){
      //Você pode configurar um dialog aqui para exibir uma mensagem de erro
      return;
    }

    ref.read(userPlacesProvider.notifier).addPlace(enteredTittle, _selectedImage!);

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _tittleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Add new Place'),
        ),

        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                controller: _tittleController,
                style: TextStyle(color: Theme.of(context).colorScheme.onSurface,)
              ),

              const SizedBox(height: 10),

              ImageInput(onPickedImage: (image) {
                _selectedImage = image;
              },),

              const SizedBox(height: 18),

              LocationInput(),

              const SizedBox(height: 18),

              ElevatedButton.icon(
                  onPressed: _savePlace,
                  icon: const Icon(Icons.add),
                  label: const Text('Add Place'))
            ]
          ),
        )
    );
  }
}