import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
        id: cast.id,
        name: cast.name,
        profilePath: cast.profilePath != ''
            ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
            : 'https://cdn.vectorstock.com/i/500p/13/68/person-gray-photo-placeholder-man-vector-23511368.jpg',
        character: cast.character,
      );
}
