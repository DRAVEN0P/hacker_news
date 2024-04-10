import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/bloc/book_mark/bookmark_bloc.dart';
import 'package:news_app/src/bloc/book_mark/bookmark_event.dart';
import 'package:news_app/src/bloc/get/get_bloc.dart';
import 'package:news_app/src/bloc/get/get_event.dart';
import 'package:news_app/src/bloc/get/get_state.dart';
import 'package:news_app/src/bloc/page_nav/page_nav_bloc.dart';
import 'package:news_app/src/bloc/page_nav/page_nav_state.dart';
import 'package:news_app/src/models/news.dart';
import 'package:news_app/src/ui/detail_pages/detail_web_page.dart';
import 'package:news_app/src/ui/widgets/neu_box.dart';
import 'package:news_app/src/utils/enums/enums.dart';

class SubNewsUi extends StatelessWidget {
  const SubNewsUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<PageNavBloc, PageNavState>(
            builder: (context, state) {
              return Text(
                state.heading,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    decorationStyle: TextDecorationStyle.solid,
                    decoration: TextDecoration.underline),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const _ListOfNews(),
        ],
      ),
    );
  }
}

class _ListOfNews extends StatelessWidget {
  const _ListOfNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: BlocBuilder<GetBloc, GetState>(
        builder: (context, state) {
          switch (state.postStatus) {
            case PostStatus.loading:
              return const Padding(
                padding: EdgeInsets.only(top: 170),
                child: Center(child: CircularProgressIndicator()),
              );
            case PostStatus.success:
              return state.isDataNotPresent
                  ? const Padding(
                      padding: EdgeInsets.only(top: 170),
                      child: Center(child: Text("N O  D A T A  F O U N D")),
                    )
                  : ListView.separated(
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        height: 15,
                      ),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.tempData.isNotEmpty
                          ? state.tempData.length
                          : state.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        final String tempTitle = state.tempData.isNotEmpty
                            ? state.tempData[index].title
                            : state.data[index].title;
                        final String by = state.tempData.isNotEmpty
                            ? state.tempData[index].by
                            : state.data[index].by;
                        final News obj = state.tempData.isNotEmpty
                            ? state.tempData[index]
                            : state.data[index];
                        return NeoBox(
                          child: SizedBox(
                            width: 300,
                            // height: 90,
                            child: _Content(
                              title: tempTitle,
                              by: by,
                              obj: obj,
                            ),
                          ),
                        );
                      },
                    );
            case PostStatus.failure:
              return const Padding(
                padding: EdgeInsets.only(top: 170),
                child: Center(child: Text("N O  D A T A  F O U N D")),
              );
          }
        },
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    super.key,
    required this.title,
    required this.by,
    required this.obj,
  });

  final String title;
  final String by;
  final News obj;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "Author: $by",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade800,
                  ),
                ),
              ),
              BlocBuilder<GetBloc, GetState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      context.read<GetBloc>().add(BookMark(obj));
                      if (!state.data[state.data.indexOf(obj)].isFav) {
                        context.read<BookMarkBloc>().add(AddBookMark(obj));
                      } else {
                        context.read<BookMarkBloc>().add(RemoveBookMark(obj));
                      }
                    },
                    child: Icon(
                      Icons.bookmark,
                      color: state.data[state.data.indexOf(obj)].isFav
                          ? Colors.black
                          : Colors.grey,
                    ),
                  );
                },
              )
            ],
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  WebView(url: obj.url
                  ),
                ),
              );
            },
            child: const Text(
              "Read More",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w500, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
