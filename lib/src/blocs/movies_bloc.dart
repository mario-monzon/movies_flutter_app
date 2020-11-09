import 'package:rxdart/rxdart.dart';
import 'package:movies_flutter_app/src/resources/repository.dart';
import 'package:movies_flutter_app/src/models/item_model.dart';

class MoviesBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<ItemModel> ();

  Observable<ItemModel> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    ItemModel itemModel = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(itemModel);
  }

  dispose() {
    _moviesFetcher.close();
  }
} // END MoviesBloc

final bloc = MoviesBloc();