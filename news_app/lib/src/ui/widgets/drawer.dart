// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/src/ui/bookmark_page/bookmark_page.dart';
import 'package:news_app/src/ui/news_page/news_main_page.dart';

class CusDrawer extends StatelessWidget {
  const CusDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              const Text(
                "H A C K E R  N E W S",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Divider(),
              ),
              const SizedBox(
                height: 50,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewsMainPage(),
                    ),
                  );
                },
                child: const Text(
                  "T O D A Y S  N E W S",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BookMarkPage(),
                    ),
                  );
                },
                child: const Text(
                  "B O O K M A R K S",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
