import 'package:music_info/models/request_data.dart';

class Request {
  final String key;
  final String id;
  final RequestData data;

  Request({this.key, this.id, this.data});

  // Use the factory keyword when implementing a constructor that doesn’t always create a new instance of its class.
  // For example, a factory constructor might return an instance from a cache, or it might return an instance of a subtype.
  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
      key: json['key'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() => {
        'key': key,
        'id': id,
        'data': data,
      };
}
