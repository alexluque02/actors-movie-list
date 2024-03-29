import 'package:actors_and_movie_list/model/movie/movie_list/results.dart';
import 'package:actors_and_movie_list/screen/movie-details_screen.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieItem extends StatefulWidget {
  final Results movie;
  const MovieItem({super.key, required this.movie});

  @override
  State<MovieItem> createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  MovieDetailsScreen(movieId: widget.movie.id),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: 'https://image.tmdb.org/t/p/w500${widget.movie.posterPath!}',
          ),
        ),
      ),
    );
  }
}
/*Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 1,
              child: Image.network(
                'https://image.tmdb.org/t/p/w500/${movie.posterPath!}',
                fit: BoxFit.fill,
              )),
          Expanded(
              flex: 3,
              child: Image.network(
                  'https://image.tmdb.org/t/p/w500/${movie.backdropPath!}'))
        ],
      )*/
/*Center(
              child: Column(
                children: [
                  Text(
                    movie.originalTitle!,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(movie.overview!),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.date_range),
                            Text(movie.releaseDate!)
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.no_adult_content_rounded),
                            Text(movie.adult! ? '+18' : '-18')
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.language),
                            Text(movie.originalLanguage!)
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.date_range),
                            Text(movie.releaseDate!)
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),*/
