import 'package:actors_and_movie_list/model/movie/movie_list/movie_list.dart';
import 'package:actors_and_movie_list/model/person/person_list/person_list.dart';
import 'package:actors_and_movie_list/screen/actors_list.dart';
import 'package:actors_and_movie_list/screen/movie_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<PersonList> fetchPeople() async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/person/popular?api_key=67e90c6f74bc6faf6aebc08470495925'));

  if (response.statusCode == 200) {
    return PersonList.fromJson(response.body);
  } else {
    throw Exception('Failed to load the people');
  }
}

Future<MovieList> fetchMovies() async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/popular?api_key=67e90c6f74bc6faf6aebc08470495925'));

  if (response.statusCode == 200) {
    return MovieList.fromJson(response.body);
  } else {
    throw Exception('Failed to load the movies');
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late Future<PersonList> peopleList;
  late Future<MovieList> movieList;

  @override
  void initState() {
    super.initState();
    peopleList = fetchPeople();
    movieList = fetchMovies();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Movies and Actors'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: <Widget>[
          FutureBuilder<PersonList>(
              future: peopleList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ActorsScreen(peopleList: snapshot.data!.results!);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              }),
          FutureBuilder<MovieList>(
              future: movieList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return MovieScreen(movieList: snapshot.data!.results!);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              }),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'People',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Movies',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
