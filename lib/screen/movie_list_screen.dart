import 'package:block_design_pattern/blocs/movie_block.dart';
import 'package:flutter/material.dart';

import '../model/movies_modal.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    movieBlock.fetchMovies();
    return Scaffold(
      appBar: AppBar(title: const Text('Moview this Week')),
      body: StreamBuilder(
        stream: movieBlock.allMovies,
        builder: (context,AsyncSnapshot<MovieModel> snapshot){
          if(snapshot.hasData){
            //data arrives
            return GridView.builder(

              itemCount: snapshot.data!.results.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 2,crossAxisSpacing: 2), itemBuilder: (context,index){
                return Image.network('https://image.tmdb.org/t/p/w185${snapshot.data!.results[index].poster_path}',
                  fit: BoxFit.fill,);
                
            });
          }else if(snapshot.hasError){
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
          
        },
      ),
    );
  }
}
