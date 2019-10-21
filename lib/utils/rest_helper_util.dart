import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:music_info/models/request_data.dart';
import 'package:music_info/models/response.dart';
import 'package:music_info/models/request.dart';

// Music Graph API Documentation
// https://rapidapi.com/macgyverapi/api/music-graph/endpoints

class RestHelperUtil {
  // Returns required http headers
  static Map<String, String> _getHeaders() {
    return {'x-rapidapi-host': "macgyverapi-music-graph-v1.p.rapidapi.com", 'x-rapidapi-key': "948ee35297msh4cffba52391389ap14c315jsn070fd6452b5d", 'content-type': "application/json", 'accept': "application/json"};
  }

  // Returns endpoint URI
  static String _getURI() {
    return "https://macgyverapi-music-graph-v1.p.rapidapi.com";
  }

  // Returns request object
  static String _buildRequest(String searchText) {
    RequestData _data = RequestData(search: searchText);
    Request req = Request(key: "free", id: "9m9c8U4f", data: _data);

    // Encode request to json
    var request = json.encode(req.toJson());
    print('$request');
    return request;
  }

  static Future<Response> searchForSong(String searchText) async {
    print('Sending post request...');

    try {
      http.Response response = await http.post(
        _getURI(),
        headers: _getHeaders(),
        body: _buildRequest(searchText),
      );

      print('Status code: ${response.statusCode}');
      print('${response.body}');

      if (response.statusCode == 200) {
        if (response.body.contains('"result":["off"]')) {
          throw Exception('Song not found');
        }

        return Response.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load song info');
      }
    } catch (error) {
      print('#searchForSong: ${error.toString()}');
      throw Exception(error.toString());
    }
  }
}
