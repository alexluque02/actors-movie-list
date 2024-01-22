import 'package:actors_and_movie_list/model/person/person_list/person_list.dart';
import 'package:actors_and_movie_list/screen/actors_list.dart';
import 'package:actors_and_movie_list/screen/movie_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<PersonList> fetchParking() async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/person/popular?api_key=67e90c6f74bc6faf6aebc08470495925'));

  if (response.statusCode == 200) {
    return PersonList.fromJson(response.body);
  } else {
    throw Exception('Failed to load de People');
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

  @override
  void initState() {
    super.initState();
    peopleList = fetchParking();
  }

  static const List<Widget> _widgetOptions = <Widget>[
    ActorsScreen(),
    MovieScreen(),
  ];

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
        title: Text('Movies and Actors'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
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
