import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotegeneratorapp/bloc_observer.dart';
import 'package:quotegeneratorapp/cubit/cubit.dart';
import 'package:quotegeneratorapp/cubit/states.dart';
import 'package:quotegeneratorapp/modules/bottom_nav.dart';
import 'package:quotegeneratorapp/network/dio_helper.dart';

void main() {
  
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>AppCubit()..getRandomQuotes(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home:BottomNavigationScreen(),
        ),
      ),
    );
  }
}


