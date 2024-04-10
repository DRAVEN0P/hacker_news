import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
        background: Colors.grey.shade300,
        primary: Colors.grey.shade500,
        secondary: Colors.grey.shade200,
        inversePrimary: Colors.grey.shade900
    )
);


ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.light(
        background: Colors.grey.shade900,
        primary: Colors.grey.shade600,
        secondary: Colors.grey.shade800,
        inversePrimary: Colors.grey.shade300
    )
);
