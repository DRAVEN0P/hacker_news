import 'package:bloc/bloc.dart';
import 'package:news_app/src/bloc/get/get_event.dart';
import 'package:news_app/src/bloc/get/get_state.dart';
import 'package:news_app/src/models/news.dart';
import 'package:news_app/src/utils/api/top_stories_api.dart';
import 'package:news_app/src/utils/enums/enums.dart';

class GetBloc extends Bloc<GetEvent, GetState> {
  List<News> tempData = [];

  GetBloc() : super(const GetState()) {
    on<OnTopStories>(_onTopStories);
    on<OnNewStories>(_onNewStories);
    on<OnBestStories>(_onBestStories);
    on<OnJobStories>(_onJobStories);
    on<OnShows>(_onShows);
    on<SetToLoading>(_setLoading);
    on<BookMark>(_bookMark);
    on<SearchItems>(_searchItem);
  }

  void _onNewStories(OnNewStories event, Emitter<GetState> emit) async {
    final data = await getAllTopStories("newstories");
    if (data.statusCode == 200) {
      emit(
        state.copyWith(data: data.newsList, postStatus: PostStatus.success),
      );
    } else {
      emit(state.copyWith(data: data.newsList, postStatus: PostStatus.failure));
    }
  }

  void _setLoading(SetToLoading event, Emitter<GetState> emit) {
    emit(state.copyWith(postStatus: PostStatus.loading));
  }

  void _onTopStories(OnTopStories event, Emitter<GetState> emit) async {
    final data = await getAllTopStories("topstories");
    if (data.statusCode == 200) {
      emit(
        state.copyWith(data: data.newsList, postStatus: PostStatus.success),
      );
    } else {
      emit(state.copyWith(data: data.newsList, postStatus: PostStatus.failure));
    }
  }

  void _onBestStories(OnBestStories event, Emitter<GetState> emit) async{
    final data = await getAllTopStories("beststories");
    if (data.statusCode == 200) {
      emit(
        state.copyWith(data: data.newsList, postStatus: PostStatus.success),
      );
    } else {
      emit(state.copyWith(data: data.newsList, postStatus: PostStatus.failure));
    }
  }

  void _onJobStories(OnJobStories event, Emitter<GetState> emit) async{
    final data = await getAllTopStories("jobstories");
    if (data.statusCode == 200) {
      emit(
        state.copyWith(data: data.newsList, postStatus: PostStatus.success),
      );
    } else {
      emit(state.copyWith(data: data.newsList, postStatus: PostStatus.failure));
    }
  }

  void _onShows(OnShows event, Emitter<GetState> emit) async{
    final data = await getAllTopStories("showstories");
    if (data.statusCode == 200) {
      emit(
        state.copyWith(data: data.newsList, postStatus: PostStatus.success),
      );
    } else {
      emit(state.copyWith(data: data.newsList, postStatus: PostStatus.failure));
    }
  }

  void _bookMark(BookMark event, Emitter<GetState> emit) {
    try {
      List<News> data = List.from(state.data);
      int index = data.indexWhere((news) => news.id == event.obj.id);
      bool isTrue = data[index].isFav;
      if (index != -1) {
        News updatedNews = data[index].copyWith(isFav: !isTrue);
        data[index] = updatedNews;
        emit(state.copyWith(data: data));
      }
    }catch(e){
      print(e);
    }
  }

  void _searchItem(SearchItems event, Emitter<GetState> emit) {
    if (event.stString.isEmpty) {
      emit(state.copyWith(tempData: []));
    } else {
      tempData = state.data
          .where((element) =>
              element.title.toString().toLowerCase().contains(event.stString))
          .toList();
      if (tempData.isEmpty) {
        emit(state.copyWith(tempData: tempData,isDataNotPresent: true));
      } else {
        emit(state.copyWith(tempData: tempData,isDataNotPresent: false));
      }
    }
  }
}
