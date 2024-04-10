import 'package:bloc/bloc.dart';
import 'package:news_app/src/bloc/theme/theme_event.dart';
import 'package:news_app/src/bloc/theme/theme_state.dart';
import 'package:news_app/src/theme/theme.dart';

class ThemeBloc extends Bloc<ThemeEvents,ThemeState>{
  ThemeBloc() : super(ThemeState(currentTheme: lightTheme)){
    on<LightTheme>(_changeToLight);
    on<DarkTheme>(_changeToDark);
  }

  void _changeToLight(LightTheme event, Emitter<ThemeState> emit){
    emit(state.copyWith(theme: lightTheme));
  }
  void _changeToDark(DarkTheme event, Emitter<ThemeState> emit){
    emit(state.copyWith(theme: darkTheme));
  }
}