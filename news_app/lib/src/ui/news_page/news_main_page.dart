import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/bloc/get/get_bloc.dart';
import 'package:news_app/src/bloc/get/get_event.dart';
import 'package:news_app/src/bloc/page_nav/page_nav_bloc.dart';
import 'package:news_app/src/bloc/page_nav/page_nav_event.dart';
import 'package:news_app/src/bloc/page_nav/page_nav_state.dart';
import 'package:news_app/src/ui/news_page/search_widgets.dart';
import 'package:news_app/src/ui/news_page/sub_news_ui.dart';
import 'package:news_app/src/ui/widgets/drawer.dart';

class NewsMainPage extends StatefulWidget {
  const NewsMainPage({super.key});

  @override
  State<NewsMainPage> createState() => _NewsMainPageState();
}

class _NewsMainPageState extends State<NewsMainPage> {
  @override
  void initState() {
    super.initState();
    context.read<GetBloc>().add(OnTopStories());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CusDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // AppBar
              const _NpAppbar(),

              // Search Area
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
                child: SearchField(),
              ),

              // Topic List
              _TopicList(),

              // Top Stories
              const SubNewsUi(),
            ],
          ),
        ),
      ),
    );
  }
}

class _NpAppbar extends StatelessWidget {
  const _NpAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: const Icon(Icons.menu),
          ),
          const SizedBox(
            width: 25.0,
          ),
          const Text("T O D A Y S   N E W S")
        ],
      ),
    );
  }
}

class _TopicList extends StatelessWidget {
  _TopicList({super.key});


  final topicList = [
    "TOP STORIES",
    "NEW STORIES",
    "BEST STORIES",
    "SHOWS",
    "JOB STORIES"
  ];

  final list = [
    TopStories(),
    NewStories(),
    BestStories(),
    Shows(),
    JobStories()
  ];

  final dataFetch = [
    OnTopStories(),
    OnNewStories(),
    OnBestStories(),
    OnShows(),
    OnJobStories()
  ];

  final selectStyle = const TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: topicList.length,
        itemBuilder: (BuildContext context, int index) {
          return TextButton(
            onPressed: () {
              context.read<GetBloc>().add(SetToLoading());
              context.read<PageNavBloc>().add(list[index]);
              context.read<GetBloc>().add(dataFetch[index]);
            },
            child: BlocBuilder<PageNavBloc, PageNavState>(
              builder: (context, state) {
                return Text(
                  topicList[index],
                  style: state.selectedPage == index ? selectStyle : null,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
