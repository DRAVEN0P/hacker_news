import 'package:bloc/bloc.dart';
import 'package:news_app/src/bloc/page_nav/page_nav_event.dart';
import 'package:news_app/src/bloc/page_nav/page_nav_state.dart';
import 'package:news_app/src/utils/api/top_stories_api.dart';
import 'package:news_app/src/utils/enums/enums.dart';

class PageNavBloc extends Bloc<PageNavEvents, PageNavState> {
  PageNavBloc() : super(const PageNavState()) {
    on<TopStories>(_onTopStories);
    on<NewStories>(_onNewStories);
    on<BestStories>(_onBestStories);
    on<JobStories>(_onJobStories);
    on<Shows>(_onShows);
  }

  void _onNewStories(NewStories event, Emitter<PageNavState> emit) {
    emit(state.copyWith(heading: "N E W  S T O R I E S",selectedPage: 1));
  }

  void _onTopStories(TopStories event, Emitter<PageNavState> emit) {
    emit(state.copyWith(heading: "T O P  S T O R I E S",selectedPage: 0));
  }

  void _onBestStories(BestStories event, Emitter<PageNavState> emit) {
    emit(state.copyWith(heading: "B E S T  S T O R I E S",selectedPage: 2));
  }

  void _onJobStories(JobStories event, Emitter<PageNavState> emit) {
    emit(state.copyWith(heading: "J O B  S T O R I E S",selectedPage: 4));
  }

  void _onShows(Shows event, Emitter<PageNavState> emit) {
    emit(state.copyWith(heading: "S H O W S",selectedPage:3));
  }
}
