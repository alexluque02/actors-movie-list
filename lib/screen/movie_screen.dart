import 'package:actors_and_movie_list/model/movie/movie_list/results.dart';
import 'package:actors_and_movie_list/widget/movie_item.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MovieScreen extends StatefulWidget {
  final List<Results> movieList;
  const MovieScreen({super.key, required this.movieList});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  bool _enabled = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _enabled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: _enabled,
      child: ListView.builder(
        itemCount: widget.movieList.length,
        itemBuilder: (context, index) {
          return MovieItem(movie: widget.movieList[index]);
        },
      ),
    );
  }
}
