import 'dart:convert';

class BelongsToCollection {
  int? id;
  String? name;
  String? posterPath;
  String? backdropPath;

  BelongsToCollection({
    this.id,
    this.name,
    this.posterPath,
    this.backdropPath,
  });

  factory BelongsToCollection.fromMap(Map<String, dynamic> data) {
    return BelongsToCollection(
      id: data['id'] as int?,
      name: data['name'] as String?,
      posterPath: data['poster_path'] as String?,
      backdropPath: data['backdrop_path'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'poster_path': posterPath,
        'backdrop_path': backdropPath,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BelongsToCollection].
  factory BelongsToCollection.fromJson(String data) {
    return BelongsToCollection.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [BelongsToCollection] to a JSON string.
  String toJson() => json.encode(toMap());
}
