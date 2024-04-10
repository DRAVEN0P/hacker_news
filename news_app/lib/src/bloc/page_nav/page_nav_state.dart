import 'package:equatable/equatable.dart';
import 'package:news_app/src/models/news.dart';
import 'package:news_app/src/utils/enums/enums.dart';

class PageNavState extends Equatable {
  // final String heading = "T O P   S T O R I E S";
  final String heading;
  final int selectedPage;

  const PageNavState({
    this.heading = "T O P   S T O R I E S",
    this.selectedPage = 0,
  });


  PageNavState copyWith({String? heading, int ? selectedPage}) {
    return PageNavState(
      heading: heading ?? this.heading,
      selectedPage: selectedPage ?? this.selectedPage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [heading];
}
