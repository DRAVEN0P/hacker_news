import 'package:news_app/src/models/news.dart';

abstract class BookMarkEvent {
  const BookMarkEvent();

  @override
  List<Object> get props => [];
}

class AddBookMark extends BookMarkEvent {
  final News obj;
  const AddBookMark(this.obj);
}
class RemoveBookMark extends BookMarkEvent {
  final News obj;
  const RemoveBookMark(this.obj);
}

