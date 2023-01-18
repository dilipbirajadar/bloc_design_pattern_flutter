
import 'dart:convert';

import '../model/movies_modal.dart';
import 'package:http/http.dart';

class MovieAPIHelper{
  Future<MovieModel> fetchMovieList() async{
    String url = "http://api.themoviedb.org/3/movie/popular?api_key=802b2c4b88ea1183e50e6b285a27696e";

    Response response = await get(Uri.parse(url));

    if(response.statusCode == 200){
      return MovieModel.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to fetch movie details') ;
    }

  }
}