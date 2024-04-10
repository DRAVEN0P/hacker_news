import 'package:bloc/bloc.dart';
import 'package:news_app/src/bloc/book_mark/bookmark_event.dart';
import 'package:news_app/src/bloc/book_mark/bookmark_state.dart';
import 'package:news_app/src/models/news.dart';

class BookMarkBloc extends Bloc<BookMarkEvent,BookMarkState>{

  List<News> finalBookMarks = [];

  BookMarkBloc() : super (const BookMarkState()){
    on<AddBookMark>(_addBookMark);
    on<RemoveBookMark>(_removeBookMark);
  }

  void _addBookMark(AddBookMark event, Emitter<BookMarkState> emit){
    List<News> data = List.from(state.bookMarks);
    data.add(event.obj);
    emit(state.copyWith(bookMarks: data));
  }

  void _removeBookMark(RemoveBookMark event, Emitter<BookMarkState> emit ){
    List<News> data = List.from(state.bookMarks);
    data.removeWhere((element) => element.id == event.obj.id);
    emit(state.copyWith(bookMarks: data));
  }
}