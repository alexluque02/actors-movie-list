import 'dart:convert';

import 'result.dart';

class VideoListResponse {
  int? id;
  List<Result>? results;

  VideoListResponse({this.id, this.results});

  factory VideoListResponse.fromMap(Map<String, dynamic> data) {
    return VideoListResponse(
      id: data['id'] as int?,
      results: (data['results'] as List<dynamic>?)
          ?.map((e) => Result.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'results': results?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [VideoListResponse].
  factory VideoListResponse.fromJson(String data) {
    return VideoListResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [VideoListResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
