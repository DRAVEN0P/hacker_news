import 'package:equatable/equatable.dart';
import 'package:news_app/src/models/news.dart';

abstract class GetEvent extends Equatable {
  const GetEvent();

  @override
  List<Object> get props => [];
}

class OnTopStories extends GetEvent {}

class OnNewStories extends GetEvent {}

class OnBestStories extends GetEvent {}

class OnShows extends GetEvent {}

class OnJobStories extends GetEvent {}

class SetToLoading extends GetEvent {}

class BookMark extends GetEvent {
  final News obj;
  const BookMark(this.obj);
}

class SearchItems extends GetEvent {

  final String stString;
  const SearchItems(this.stString);

}
