import 'dart:async';
import 'package:http/http.dart' as http show Client ;
import 'dart:convert';
import 'package:movies_flutter_app/src/models/item_model.dart';

class MovieApiProvider{

  http.Client client = http.Client();
  final _apiKey = '6b620a8ab956bb4d6bdf7f8edc5c070b';
  final url = 'https://api.themoviedb.org/3/movie/550?api_key=6b620a8ab956bb4d6bdf7f8edc5c070b';
  
  Future<ItemModel> fetchMovielist() async {
    print('Entered');
    final response = await client.get('http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey');

    print(response.body.toString());

    if( response.statusCode == 200 ) {
      return ItemModel.fromJson(json.decode( response.body ));
    } else {
      throw Exception ('Failed to load post');
    }
  } // fetchMovielist
  
} // END MovieApiProvider
