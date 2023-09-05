import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotegeneratorapp/featuresa/home/manager/cubit/states.dart';

import '../../../../core/utils/api_services/dio_helper.dart';
import '../../../search/data/search_model.dart';
import '../../data/quote_model.dart';


class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppInitialState());
  static AppCubit get(context)=>BlocProvider.of(context);


  int currentIndex = 0;
  setBottomBarIndex(index) {  
      currentIndex = index;
      emit(ChangeBottomNavState()) ;
}
//get random quotes
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

//search
SearchModel? searchModel;
void Search({required String query}){
  emit(SearchLoadingState());
  DioHelper.getData(
    url: 'search/quotes/',
    query:{'query':query} ).
  then((value){
   searchModel=SearchModel.fromJson(value.data);
   print(value.data);
   emit(SearchSuccessState());
  }).catchError((error){
    print(error.toString());
    emit(SearchErrorState());
  });
}
List<dynamic>quotes=[];

void addQuoteToFavorites(dynamic model) {
  quotes.add(model);
  print(quotes);
  emit(AppAddQuoteToFavoritesState());
}

void removeQuoteFromFavorites(dynamic model) {
  quotes.remove(model);
  emit(AppRemoveQuoteFromFavoritesState());
}




}