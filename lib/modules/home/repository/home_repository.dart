import 'package:fpdart/fpdart.dart';
import 'package:sports_booking/core/data/src/api_failure.dart';
import 'package:sports_booking/modules/home/model/sport_place_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class IHomeRepository {
  TaskEither<Failure, List<SportPlaceModel>> fetchSportPlaces();
}

class HomeRepository implements IHomeRepository {
  @override
  TaskEither<Failure, List<SportPlaceModel>> fetchSportPlaces() {
    return TaskEither.tryCatch(
      () async {
        final database = await Supabase.instance.client.from('sport_places').select('*');
        final List<SportPlaceModel> list = [];
        for (final json in database) {
          list.add(SportPlaceModel.fromJson(json));
        }
        return list;
      },
      (error, stackTrace) {
        return APIFailure();
      },
    );
  }
}
