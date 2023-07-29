import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotegeneratorapp/modules/fav.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});
  TextEditingController searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
      return BlocConsumer<AppCubit,AppStates>(
      listener:(context,state){} ,
      builder:(context,state){
      return Scaffold(
         backgroundColor: Color(0xff8249B5),
         body: Padding(
           padding: const EdgeInsets.all(20.0),
           child: Column(
            children: [
              Container(
                width:double.infinity ,
                height:60.0 ,
                decoration: BoxDecoration(
                  color:Colors.white ,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: TextFormField(
                  controller:searchController ,
                  keyboardType: TextInputType.text,
                  
                ),
              ),
              const SizedBox(height:20.0),
              itemBuilder(),
           ]),
         ),
      );}
    );
  }
}