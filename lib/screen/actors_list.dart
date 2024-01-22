import 'package:actors_and_movie_list/model/person/person_list/result.dart';
import 'package:actors_and_movie_list/widget/person_item.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ActorsScreen extends StatefulWidget {
  final List<Result> peopleList;
  const ActorsScreen({super.key, required this.peopleList});

  @override
  State<ActorsScreen> createState() => _ActorsScreenState();
}

class _ActorsScreenState extends State<ActorsScreen> {
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
        itemCount: widget.peopleList.length,
        itemBuilder: (context, index) {
          return PersonItem(person: widget.peopleList[index]);
        },
      ),
    );
  }
}
