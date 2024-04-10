import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/bloc/get/get_bloc.dart';
import 'package:news_app/src/bloc/get/get_event.dart';

final textAreaBorderStyle = OutlineInputBorder(
  borderRadius: BorderRadius.circular(30),
  borderSide: BorderSide(
    color: Colors.grey.shade400,
    width: 0.5,
  ),
);


class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return TextFormField(
      onChanged: (key){
        // print(key);
        context.read<GetBloc>().add(SearchItems(key));
      },
      obscureText: false,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12.0),
        constraints: BoxConstraints(
          maxHeight: height * 0.065,
          maxWidth: width * 0.9,
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.secondary,
        hintText: "Search",
        border: textAreaBorderStyle,
        focusedBorder: textAreaBorderStyle.copyWith(
            borderSide: BorderSide(color: Colors.grey.shade500)),
        // -- In normal mode
        enabledBorder: textAreaBorderStyle,
        prefixIcon: const Icon(Icons.search),
      ),
    );
  }
}
