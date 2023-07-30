import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotegeneratorapp/cubit/states.dart';
import 'package:bloc/bloc.dart';

import '../model.dart';
import '../network/dio_helper.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppInitialState());
  static AppCubit get(context)=>BlocProvider.of(context);


  int currentIndex = 0;
  setBottomBarIndex(index) {  
      currentIndex = index;
      emit(ChangeBottomNavState()) ;
}

QuotesModel? quotesModel;
void getRandomQuotes(){
  emit(GetRandomQuotesLoadingState());
  DioHelper.getData(url: 'random').
  then((value){
   quotesModel=QuotesModel.fromJson(value.data);
   print(value.data);
   emit(GetRandomQuotesSuccessState());
  }).catchError((error){
    print(error.toString());
    emit(GetRandomQuotesErrorState());
  });
}

}