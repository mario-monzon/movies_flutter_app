import 'dart:async';
import 'movie_api_provider.dart';
import 'package:movies_flutter_app/src/models/item_model.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<ItemModel> fetchAllMovies () => moviesApiProvider.fetchMovielist();
}