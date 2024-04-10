import 'package:equatable/equatable.dart';
import 'package:news_app/src/models/news.dart';

class BookMarkState extends Equatable {
  final List<News> bookMarks;

  const BookMarkState({
    this.bookMarks = const [],
  });

  BookMarkState copyWith({List<News>? bookMarks}) {
    return BookMarkState(
      bookMarks: bookMarks ?? this.bookMarks
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [bookMarks];
}
