import 'package:actors_and_movie_list/model/person/person_response/person_response.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PersonDetailsScreen extends StatelessWidget {
  final PersonResponse person;
  const PersonDetailsScreen({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded,
                color: Color.fromARGB(255, 0, 0, 0)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: Text(person.name!)),
      body: ListView(children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 223, 222, 222),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  'https://image.tmdb.org/t/p/original/${person.profilePath!}',
                  width: 100,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                person.name!,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Biography',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Text(
                          person.biography!,
                          style: const TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            text: TextSpan(
                              text: 'Birthday: ',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                TextSpan(
                                    text: person.birthday!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            text: TextSpan(
                              text: 'Origin: ',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                TextSpan(
                                    text: person.placeOfBirth!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            text: TextSpan(
                              text: 'Department: ',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                TextSpan(
                                    text: person.knownForDepartment!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  'Popularity: ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                CircularPercentIndicator(
                                  radius: 20.0,
                                  lineWidth: 5.0,
                                  percent: (person.popularity! / 1000),
                                  center: Text(
                                      '${(person.popularity! / 10).toStringAsFixed(0)}%'),
                                  progressColor: Colors.green,
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ]),
    );
  }
}
