// ignore_for_file: avoid_print

import 'package:actors_and_movie_list/model/movie/movie_response/movie_response.dart';
import 'package:actors_and_movie_list/widget/video_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:transparent_image/transparent_image.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int? movieId;
  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late Future<MovieResponse> movie;

  Future<MovieResponse> fetchMovie() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/${widget.movieId}?api_key=67e90c6f74bc6faf6aebc08470495925'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to load the movie');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movie = fetchMovie();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieResponse>(
        future: movie,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
                appBar: AppBar(title: Text(snapshot.data!.originalTitle!)),
                body: ListView(
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          const Center(
                            child: CircularProgressIndicator(),
                          ),
                          FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image:
                                'https://image.tmdb.org/t/p/w500${snapshot.data!.backdropPath}',
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'OVERVIEW',
                              style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 12, left: 12, bottom: 12),
                            child: Text(
                              snapshot.data!.overview!,
                              style: GoogleFonts.lato(
                                  textStyle: const TextStyle(fontSize: 12)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'VIDEOS',
                              style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          VideoWidget(
                            movieId: snapshot.data!.id!,
                          ),
                        ],
                      ),
                    )
                  ],
                ));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        });
  }
}
