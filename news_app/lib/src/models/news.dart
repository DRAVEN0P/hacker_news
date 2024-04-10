class News {
  final String by;

  News({
    required this.by,
    required this.id,
    required this.title,
    required this.type,
    required this.url,
    this.isFav = false,
  });

  final int id;
  final String title;
  final String type;
  final String url;
  bool isFav;

  News copyWith({required bool isFav}) {
    return News(isFav: isFav, by: by,url: url,type: type,title: title,id: id);
  }
}
