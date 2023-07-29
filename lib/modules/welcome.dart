import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';

class WelcomeScreen extends StatelessWidget {
   WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener:(context,state){} ,
      builder:(context,state){
        return Scaffold(
         backgroundColor: Color(0xff8249B5),
         body:Padding(
           padding: const EdgeInsets.all(20.0),
           child: Center(
           child: Icon(
            Icons.format_quote_outlined,
            color: Color.fromARGB(146, 192, 174, 197),
            size: 100.0,
            ),

           ),
           ),
         
      );}
    );
  }
}