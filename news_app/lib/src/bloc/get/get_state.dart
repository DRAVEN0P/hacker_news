import 'package:equatable/equatable.dart';
import 'package:news_app/src/models/news.dart';
import 'package:news_app/src/utils/enums/enums.dart';

class GetState extends Equatable {
  final List<News> data;
  final PostStatus postStatus;
  final List<News> tempData;
  final bool isDataNotPresent;

  const GetState({
    this.postStatus = PostStatus.loading,
    this.data = const [],
    this.tempData = const [],
    this.isDataNotPresent = false
  });


  GetState copyWith({List<News>? data , PostStatus ? postStatus , List<News>? tempData , bool ? isDataNotPresent }) {
    return GetState(
        data: data ?? this.data,
        postStatus: postStatus ?? this.postStatus,
        tempData: tempData ?? this.tempData,
        isDataNotPresent: isDataNotPresent ?? this.isDataNotPresent,
    );
  }


  @override
  // TODO: implement props
  List<Object?> get props => [data,postStatus,tempData,isDataNotPresent];
}
