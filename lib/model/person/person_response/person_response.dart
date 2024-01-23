import 'dart:convert';

class PersonResponse {
  bool? adult;
  List<dynamic>? alsoKnownAs;
  String? biography;
  String? birthday;
  dynamic deathday;
  int? gender;
  dynamic homepage;
  int? id;
  String? imdbId;
  String? knownForDepartment;
  String? name;
  String? placeOfBirth;
  double? popularity;
  String? profilePath;

  PersonResponse({
    this.adult,
    this.alsoKnownAs,
    this.biography,
    this.birthday,
    this.deathday,
    this.gender,
    this.homepage,
    this.id,
    this.imdbId,
    this.knownForDepartment,
    this.name,
    this.placeOfBirth,
    this.popularity,
    this.profilePath,
  });

  factory PersonResponse.fromMap(Map<String, dynamic> data) {
    return PersonResponse(
      adult: data['adult'] as bool?,
      alsoKnownAs: data['also_known_as'] as List<dynamic>?,
      biography: data['biography'] as String?,
      birthday: data['birthday'] as String?,
      deathday: data['deathday'] as dynamic,
      gender: data['gender'] as int?,
      homepage: data['homepage'] as dynamic,
      id: data['id'] as int?,
      imdbId: data['imdb_id'] as String?,
      knownForDepartment: data['known_for_department'] as String?,
      name: data['name'] as String?,
      placeOfBirth: data['place_of_birth'] as String?,
      popularity: (data['popularity'] as num?)?.toDouble(),
      profilePath: data['profile_path'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'adult': adult,
        'also_known_as': alsoKnownAs,
        'biography': biography,
        'birthday': birthday,
        'deathday': deathday,
        'gender': gender,
        'homepage': homepage,
        'id': id,
        'imdb_id': imdbId,
        'known_for_department': knownForDepartment,
        'name': name,
        'place_of_birth': placeOfBirth,
        'popularity': popularity,
        'profile_path': profilePath,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PersonResponse].
  factory PersonResponse.fromJson(String data) {
    return PersonResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PersonResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
