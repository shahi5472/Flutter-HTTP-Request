class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory Photo.fromJson(final json) {
    return Photo(
        albumId: json['albumId'],
        id: json['id'],
        title: json["title"],
        url: json["'url"],
        thumbnailUrl: json["thumbnailUrl"]);
  }
}
