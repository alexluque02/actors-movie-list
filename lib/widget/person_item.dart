import 'package:actors_and_movie_list/model/person/person_list/result.dart';
import 'package:actors_and_movie_list/screen/person-details-screen.dart';
import 'package:flutter/material.dart';

class PersonItem extends StatelessWidget {
  final Result person;
  const PersonItem({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const PersonDetailsScreen(),
            ),
          );
        },
        child: Card(
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
                          'https://image.tmdb.org/t/p/w500/${person.profilePath!}',
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
                              person.originalName!,
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
        )),
      ),
    );
  }
}
