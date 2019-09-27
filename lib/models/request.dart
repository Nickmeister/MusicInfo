class Request {
  final String key;
  final String id;
  final RequestData data;

  Request({this.key, this.id, this.data});

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

class RequestData {
  final String search;

  RequestData({
    this.search,
  });

  factory RequestData.fromJson(Map<String, dynamic> json) {
    return RequestData(
      search: json['search'],
    );
  }
  Map<String, dynamic> toJson() => {
        'search': search,
      };
}
