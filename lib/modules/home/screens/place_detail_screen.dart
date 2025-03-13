import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sports_booking/modules/home/model/sport_place_model.dart';

@RoutePage()
class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({required this.sportPlace, super.key});

  final SportPlaceModel sportPlace;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('${sportPlace.placeName}')));
  }
}
