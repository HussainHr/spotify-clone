import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode>{
  
  ThemeCubit() : super(ThemeMode.light);
  
  void updateTheme(ThemeMode themeMode) => emit(themeMode);
  
  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    try{
      final themeIndex = json['themeMode'] as int?;
      if(themeIndex != null){
        return ThemeMode.values[themeIndex];
      }
    }catch (e){
      return null;
    }
    return ThemeMode.light;
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    try {
      return {'themeMode': state.index};
    } catch (e) {
      return null;
    }
  }
  
}