import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/bloc/book_mark/bookmark_bloc.dart';
import 'package:news_app/src/bloc/get/get_bloc.dart';
import 'package:news_app/src/bloc/page_nav/page_nav_bloc.dart';
import 'package:news_app/src/bloc/theme/theme_bloc.dart';
import 'package:news_app/src/theme/theme.dart';
import 'package:news_app/src/ui/news_page/news_main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeBloc()),
        BlocProvider(create: (_) => PageNavBloc()),
        BlocProvider(create: (_) => GetBloc()),
        BlocProvider(create: (_) => BookMarkBloc()),
      ],
      child: MaterialApp(
        theme: lightTheme,
        // home: const Scaffold(),
        home: const NewsMainPage(),
      ),
    );
  }
}
