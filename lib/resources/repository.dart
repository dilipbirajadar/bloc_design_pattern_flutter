import 'package:block_design_pattern/resources/movie_api_helper.dart';

class Repository{
  fetchAllMovies()=> MovieAPIHelper().fetchMovieList();
}