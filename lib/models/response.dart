import 'package:music_info/models/response_thumbnail.dart';

class Response {
  final String songName;
  final String albumTitle;
  final ResponseThumbnail thumbnails;
  final List<String> genre;
  final String releaseDate;
  final String artist;
  final String ytVideo;

  Response({this.songName, this.albumTitle, this.thumbnails, this.genre, this.releaseDate, this.artist, this.ytVideo});

  factory Response.fromJson(Map<String, dynamic> json) {
    String _songName = json['result'][0]['songName'];
    String _albumTitle = json['result'][0]['albumTitle'];
    ResponseThumbnail _thumbnails = ResponseThumbnail.fromJson(json['result'][0]['thumbnails']);
    String _releaseDate = json['result'][0]['releaseDate'];
    String _artist = json['result'][0]['artist'];
    String _ytVideo = 'https://www.youtube.com/watch?v=' + json['result'][0]['ytVideo'];
    List<String> _genre = json['result'][0]['genre'].cast<String>();

    print('Song name: $_songName');
    print('Artist: $_artist');
    print('Album: $_albumTitle');
    print('Release Date: $_releaseDate');
    print('YouTube: $_ytVideo');
    print('Genres: ');
    for (String g in _genre) {
      print(' - $g');
    }
    print('Thumbnails:');
    print(' - High Quality:  ${_thumbnails.highQuality}');
    print(' - Standard Quality:  ${_thumbnails.standard}');

    return Response(songName: _songName, albumTitle: _albumTitle, thumbnails: _thumbnails, releaseDate: _releaseDate, artist: _artist, ytVideo: _ytVideo, genre: _genre);
  }
}


