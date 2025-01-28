import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//get now_playing
final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifire, List<Movie>>(
  (ref) {
    final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
    return MoviesNotifire(fetchMoreMovies: fetchMoreMovies);
  },
);

// get popular
final popularMoviesProvider =
    StateNotifierProvider<MoviesNotifire, List<Movie>>(
  (ref) {
    final fetchMoreMovies = ref.watch(movieRepositoryProvider).getPopular;
    return MoviesNotifire(fetchMoreMovies: fetchMoreMovies);
  },
);

//get upcoming
final upcomingMoviesProvider =
    StateNotifierProvider<MoviesNotifire, List<Movie>>(
  (ref) {
    final fetchMoreMovies = ref.watch(movieRepositoryProvider).getUpcoming;
    return MoviesNotifire(fetchMoreMovies: fetchMoreMovies);
  },
);

//get top_rated
final topRatedMoviesProvider =
    StateNotifierProvider<MoviesNotifire, List<Movie>>(
  (ref) {
    final fetchMoreMovies = ref.watch(movieRepositoryProvider).getTopRated;
    return MoviesNotifire(fetchMoreMovies: fetchMoreMovies);
  },
);

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifire extends StateNotifier<List<Movie>> {
  int currenPage = 0;
  bool isLoading = false;

  MovieCallback fetchMoreMovies;

  MoviesNotifire({
    required this.fetchMoreMovies,
  }) : super([]);

  Future<void> loadNextPage() async {
    if (isLoading) return;

    isLoading = true;
    currenPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currenPage);
    state = [...state, ...movies];

    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}
