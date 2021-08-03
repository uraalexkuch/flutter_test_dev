class File {
  // Attributes
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  // Constructor

  File({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  // convert Json to an car object object
  factory File.fromJson(Map<String, dynamic> json) {
    return File(
      albumId: json["albumId"].toInt(),
      id: json["id"].toInt(),
      title: json["title"].toString(),
      url: json["url"].toString(),
      thumbnailUrl: json["thumbnailUrl"].toString(),
    );
  }
}
