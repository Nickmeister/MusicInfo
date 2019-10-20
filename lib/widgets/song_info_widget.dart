import 'package:flutter/material.dart';
import 'package:music_info/models/response.dart';

class SongInfoWidget extends StatelessWidget {
  SongInfoWidget({key, this.info}) : super(key: key);

  final Response info;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.music_note),
            title: Text(
              info.songName,
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18.0),
            ),
            subtitle: Text(
              info.artist,
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16.0),
            ),
          ),
          ListTile(
            leading: Icon(Icons.disc_full),
            title: Text(
              info.albumTitle,
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16.0),
            ),
            subtitle: Text(
              info.releaseDate,
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14.0),
            ),
          )
        ],
      ),
    );
  }
}
