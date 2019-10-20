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
