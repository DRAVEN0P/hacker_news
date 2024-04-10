import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:news_app/src/theme/theme.dart';

class ThemeState extends Equatable {
  final ThemeData currentTheme;

  const ThemeState({required this.currentTheme});

  ThemeState copyWith({ThemeData? theme}) {
    return ThemeState(currentTheme: theme ?? lightTheme);
  }

  @override
  List<Object?> get props => [currentTheme];
}
