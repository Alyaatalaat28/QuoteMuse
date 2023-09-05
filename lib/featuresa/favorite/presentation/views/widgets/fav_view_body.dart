import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotegeneratorapp/featuresa/favorite/presentation/views/widgets/fav_item.dart';

import '../../../../home/manager/cubit/cubit.dart';
import '../../../../home/manager/cubit/states.dart';


class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
      return BlocConsumer<AppCubit,AppStates>(
      listener:(context,state){} ,
      builder:(context,state){
      var cubit=AppCubit.get(context);
      return Scaffold(
         backgroundColor: const Color(0xff8249B5),
         body: ConditionalBuilder(
          // ignore: unnecessary_null_comparison
          condition:cubit.quotes!=null,
           builder:(context)=> ListView.separated(
            itemBuilder: (context,index)=>FavItem(model:cubit.quotes[index]),
             separatorBuilder: ((context, index) =>const SizedBox(
              height: 5.0,
             )),
              itemCount: cubit.quotes.length),
              fallback:(context)=>const Center(child: CircularProgressIndicator()),
         ),
      );}
    );
  }
  
}
