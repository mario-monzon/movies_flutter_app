import 'package:flutter/material.dart';
import 'package:movies_flutter_app/src/models/item_model.dart';
import 'package:movies_flutter_app/src/blocs/movies_bloc.dart';

class MovieList extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    bloc.fetchAllMovies();
    return Scaffold(
      appBar: AppBar(
        title: Text( 'Popular Movis' ),
      ),
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
          // return Center(child: CircularProgressIndicator());
          if ( snapshot.hasData ){
            return buildList(snapshot);
          } else {
            return Text(snapshot.error.toString());
          }
        },
      ),
    );
  }
  
  // buildList
  
  
}

Widget buildList(AsyncSnapshot<ItemModel> snapshot) {

  return GridView.builder(
      itemCount: snapshot.data.toJson().length,
      gridDelegate: 
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
      itemBuilder: ( BuildContext context, int index ) {
        return Image.network(
          'https://image.tmdb.org/t/p/w185${snapshot.data
            .toJson()[index].poster_path}',
          fit: BoxFit.cover,);
      });
}