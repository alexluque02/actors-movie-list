import 'package:actors_and_movie_list/model/person/person_list/result.dart';
import 'package:actors_and_movie_list/model/person/person_response/person_response.dart';
import 'package:actors_and_movie_list/screen/person_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PersonItem extends StatefulWidget {
  final Result person;
  const PersonItem({super.key, required this.person});

  @override
  State<PersonItem> createState() => _PersonItemState();
}

class _PersonItemState extends State<PersonItem> {
  late Future<PersonResponse> person;

  Future<PersonResponse> fetchPerson() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/person/${widget.person.id}?api_key=67e90c6f74bc6faf6aebc08470495925'));

    if (response.statusCode == 200) {
      return PersonResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to load the people');
    }
  }

  @override
  void initState() {
    super.initState();
    person = fetchPerson();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => FutureBuilder<PersonResponse>(
                  future: person,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return PersonDetailsScreen(person: snapshot.data!);
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ),
            );
          },
          child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                  'https://image.tmdb.org/t/p/w500/${widget.person.profilePath!}'))

          /*Card(
            child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500/${widget.person.profilePath!}',
                          height: 140,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.person.originalName!,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            )
          ],
        )),*/
          ),
    );
  }
}
