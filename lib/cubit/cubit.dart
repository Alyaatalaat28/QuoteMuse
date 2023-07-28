import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotegeneratorapp/cubit/states.dart';
import 'package:bloc/bloc.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppInitialState());
  static AppCubit get(context)=>BlocProvider.of(context);


  int currentIndex = 0;
  setBottomBarIndex(index) {  
      currentIndex = index;
      emit(ChangeBottomNavState()) ;
}
}