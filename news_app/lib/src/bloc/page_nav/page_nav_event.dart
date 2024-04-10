import 'package:equatable/equatable.dart';

abstract class PageNavEvents extends Equatable {
  const PageNavEvents();

  @override
  List<Object> get props => [];
}

class TopStories extends PageNavEvents {}

class NewStories extends PageNavEvents {}

class BestStories extends PageNavEvents {}

class Shows extends PageNavEvents {}

class JobStories extends PageNavEvents {}
