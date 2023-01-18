//Bloc is an interface between UI and Data Layer
import 'package:block_design_pattern/model/movies_modal.dart';

import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class _MovieBloc{
  //Access to Repository
  final repository = Repository();
  //Asynchrounous Data Stream --> Observables or Subject
  //Data provider -Stream
  //Data Consumer -Sink
  //PublishSubject -Act as a Stream and Sink
  final _movieFetcher = PublishSubject <MovieModel> ();

  get allMovies => _movieFetcher.stream;//provide data to UI

  fetchMovies() async {
    MovieModel movies = await repository.fetchAllMovies();
    _movieFetcher.sink.add(movies);//Add data to the PublishSubject object _movieFetcher

  }

}

final movieBlock = _MovieBloc();//Singleton Object