import 'package:equatable/equatable.dart';

abstract class ThemeEvents extends Equatable{
  const ThemeEvents();

  @override
  List<Object> get props => [];
}

class LightTheme extends ThemeEvents {}

class DarkTheme extends ThemeEvents {}