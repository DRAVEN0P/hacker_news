import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/bloc/book_mark/bookmark_bloc.dart';
import 'package:news_app/src/bloc/book_mark/bookmark_event.dart';
import 'package:news_app/src/bloc/book_mark/bookmark_state.dart';
import 'package:news_app/src/bloc/get/get_bloc.dart';
import 'package:news_app/src/bloc/get/get_event.dart';
import 'package:news_app/src/models/news.dart';
import 'package:news_app/src/ui/detail_pages/detail_web_page.dart';
import 'package:news_app/src/ui/widgets/drawer.dart';
import 'package:news_app/src/ui/widgets/neu_box.dart';

class BookMarkPage extends StatelessWidget {
  const BookMarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: CusDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _BMAppbar(),
              Padding(
                padding: EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  "B O O K  M A R K S",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              _BookMarksList(),
            ],
          ),
        ),
      ),
    );
  }
}

class _BMAppbar extends StatelessWidget {
  const _BMAppbar({super.key});

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
          const Text("H A C K E R  N E W S")
        ],
      ),
    );
  }
}

class _BookMarksList extends StatelessWidget {
  const _BookMarksList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookMarkBloc, BookMarkState>(
      builder: (context, state) {
        return state.bookMarks.isEmpty
            ? const Padding(
                padding: EdgeInsets.only(top: 170),
                child: Center(child: Text("N O  B O O K M A R K  F O U N D")),
              )
            : ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.bookMarks.length,
                itemBuilder: (BuildContext context, int index) {
                  final String title = state.bookMarks[index].title;
                  final String by = state.bookMarks[index].by;
                  final News obj = state.bookMarks[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: NeoBox(
                        child: SizedBox(
                      width: 300,
                      child: _Content(
                        title: title,
                        by: by,
                        obj: obj,
                      ),
                    )),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: 15,
                ),
              );
      },
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
            style: const TextStyle(fontSize: 18),
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
                    color: Colors.grey.shade800,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.read<GetBloc>().add(BookMark(obj));
                  context.read<BookMarkBloc>().add(RemoveBookMark(obj));
                },
                child: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
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
                  fontSize: 16, fontWeight: FontWeight.w500, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
