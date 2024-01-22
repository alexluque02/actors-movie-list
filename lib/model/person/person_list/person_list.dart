import 'dart:convert';

import 'result.dart';

class PersonList {
  int? page;
  List<Result>? results;
  int? totalPages;
  int? totalResults;

  PersonList({this.page, this.results, this.totalPages, this.totalResults});

  factory PersonList.fromMap(Map<String, dynamic> data) => PersonList(
        page: data['page'] as int?,
        results: (data['results'] as List<dynamic>?)
            ?.map((e) => Result.fromMap(e as Map<String, dynamic>))
            .toList(),
        totalPages: data['total_pages'] as int?,
        totalResults: data['total_results'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'page': page,
        'results': results?.map((e) => e.toMap()).toList(),
        'total_pages': totalPages,
        'total_results': totalResults,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PersonList].
  factory PersonList.fromJson(String data) {
    return PersonList.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PersonList] to a JSON string.
  String toJson() => json.encode(toMap());
}
