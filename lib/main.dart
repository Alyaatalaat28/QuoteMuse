import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utils/api_services/dio_helper.dart';
import 'core/utils/bloc_observer.dart';
import 'featuresa/home/manager/cubit/cubit.dart';
import 'featuresa/home/manager/cubit/states.dart';
import 'featuresa/home/presentation/views/widgets/custom_bottom_nav.dart';


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
        builder: (context, state) => const MaterialApp(
          debugShowCheckedModeBanner: false,
          home:BottomNavigationScreen(),
        ),
      ),
    );
  }
}


