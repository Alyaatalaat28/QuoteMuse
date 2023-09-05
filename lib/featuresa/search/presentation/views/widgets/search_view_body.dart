import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotegeneratorapp/featuresa/search/presentation/views/widgets/search_builder.dart';

import '../../../../home/manager/cubit/cubit.dart';
import '../../../../home/manager/cubit/states.dart';


// ignore: must_be_immutable
class SearchViewBody extends StatelessWidget {
   SearchViewBody({super.key});
  TextEditingController searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
      return BlocConsumer<AppCubit,AppStates>(
      listener:(context,state){} ,
      builder:(context,state){
        var cubit=AppCubit.get(context);
      return Scaffold(
         backgroundColor: const Color(0xff8249B5),
         appBar: AppBar(
          elevation: 0.0,
          backgroundColor:const Color(0xff8249B5) ,
         ),
         body: SingleChildScrollView(
           child: Padding(
             padding: const EdgeInsets.all(20.0),
             child: Column(
              children: [
                Container(
                  width:double.infinity ,
                  decoration: BoxDecoration(
                    color:Colors.white ,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: TextFormField(
                    controller:searchController ,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    onFieldSubmitted: (value) {
                      cubit.Search(query: value);
                    },
                    validator: (value){
                       if(value!.isEmpty){
                        return'Enter Text To Search';
                      }else{
                        return null;
                      }
                    },
                    
                  ),
                ),
                const SizedBox(height:10.0),
                  if(state is SearchLoadingState)
                    const LinearProgressIndicator(),
                  if(state is SearchSuccessState)
                  ConditionalBuilder(
                    condition: cubit.searchModel!=null,
                    builder:(context)=> ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder:(context,index)=> SearchBuilder(model:cubit.searchModel!.results![index]),
                      separatorBuilder:(context,index)=>const SizedBox(height: 5.0,),
                      itemCount:cubit.searchModel!.results!.length ),
                      fallback: (context)=>const Center(child:CircularProgressIndicator()),
                  ),
                    
             ]),
           ),
         ),
      );}
    );
  }
}