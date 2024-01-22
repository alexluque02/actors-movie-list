import 'dart:convert';

class KnownFor {
  bool? adult;
  String? backdropPath;
  int? id;
  String? name;
  String? originalLanguage;
  String? originalName;
  String? overview;
  String? posterPath;
  String? mediaType;
  List<int>? genreIds;
  double? popularity;
  String? firstAirDate;
  double? voteAverage;
  int? voteCount;
  List<String>? originCountry;

  KnownFor({
    this.adult,
    this.backdropPath,
    this.id,
    this.name,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.genreIds,
    this.popularity,
    this.firstAirDate,
    this.voteAverage,
    this.voteCount,
    this.originCountry,
  });

  factory KnownFor.fromMap(Map<String, dynamic> data) => KnownFor(
        adult: data['adult'] as bool?,
        backdropPath: data['backdrop_path'] as String?,
        id: data['id'] as int?,
        name: data['name'] as String?,
        originalLanguage: data['original_language'] as String?,
        originalName: data['original_name'] as String?,
        overview: data['overview'] as String?,
        posterPath: data['poster_path'] as String?,
        mediaType: data['media_type'] as String?,
        genreIds: (data['genre_ids'] as List<dynamic>?)
            ?.map((dynamic id) => id is int ? id : 0)
            .toList(),
        popularity: (data['popularity'] as num?)?.toDouble(),
        firstAirDate: data['first_air_date'] as String?,
        voteAverage: (data['vote_average'] as num?)?.toDouble(),
        voteCount: data['vote_count'] as int?,
        originCountry: (data['origin_country'] as List<dynamic>?)
            ?.map((dynamic country) => country is String ? country : '')
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'adult': adult,
        'backdrop_path': backdropPath,
        'id': id,
        'name': name,
        'original_language': originalLanguage,
        'original_name': originalName,
        'overview': overview,
        'poster_path': posterPath,
        'media_type': mediaType,
        'genre_ids': genreIds,
        'popularity': popularity,
        'first_air_date': firstAirDate,
        'vote_average': voteAverage,
        'vote_count': voteCount,
        'origin_country': originCountry,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [KnownFor].
  factory KnownFor.fromJson(String data) {
    return KnownFor.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [KnownFor] to a JSON string.
  String toJson() => json.encode(toMap());
}
