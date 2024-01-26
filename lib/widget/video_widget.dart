import 'package:actors_and_movie_list/model/movie/video_list_response/video_list_response.dart';
import 'package:actors_and_movie_list/screen/video_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VideoWidget extends StatefulWidget {
  final int movieId;
  const VideoWidget({super.key, required this.movieId});

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late Future<VideoListResponse> videos;

  Future<VideoListResponse> fetchVideos() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/${widget.movieId}/videos?api_key=67e90c6f74bc6faf6aebc08470495925'));

    if (response.statusCode == 200) {
      return VideoListResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to load the videos');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videos = fetchVideos();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<VideoListResponse>(
      future: videos,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.results!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => VideoScreen(
                            keyYt: snapshot.data!.results![index].key!),
                      ),
                    );
                  },
                  child: Image.network(
                    'https://img.youtube.com/vi/${snapshot.data!.results![index].key!}/0.jpg',
                  ),
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
