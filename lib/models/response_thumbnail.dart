class ResponseThumbnail {
  final String highQuality;
  final String standard;

  ResponseThumbnail({this.highQuality, this.standard});

  factory ResponseThumbnail.fromJson(Map<String, dynamic> json) {
    return ResponseThumbnail(
      highQuality: json['highQuality'],
      standard: json['standard'],
      );
    }
  }