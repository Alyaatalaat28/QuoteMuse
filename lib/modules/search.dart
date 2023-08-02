import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotegeneratorapp/models/quote_model.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../models/search_model.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});
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
                    decoration: InputDecoration(
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
                    LinearProgressIndicator(),
                  if(state is SearchSuccessState)
                  ConditionalBuilder(
                    condition: cubit.searchModel!=null,
                    builder:(context)=> ListView.separated(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder:(context,index)=> searchBuilder(cubit.searchModel!.results![index]),
                      separatorBuilder:(context,index)=>SizedBox(height: 5.0,),
                      itemCount:cubit.searchModel!.results!.length ),
                      fallback: (context)=>Center(child:CircularProgressIndicator()),
                  ),
                    
             ]),
           ),
         ),
      );}
    );
  }
}
Widget searchBuilder(Results model)=> SingleChildScrollView(
  child: Builder(
    builder: (context) {
       var cubit=AppCubit.get(context);
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child:   Container(
          padding:EdgeInsets.all(20.0) ,
                   width: double.infinity,
                   height: 250.0,
                   color:  Colors.white,
                   child:Column(
                    children: [
                      Text('${model.content}',
                      style: GoogleFonts.gemunuLibre(
                        color: Color(0xff323232),
                        fontWeight: FontWeight.w400,
                        fontSize: 26.0,
                      ),), 
                      const SizedBox(height:10.0),
                      Row(
                        children:[
                          const Spacer(),
                          Text('${model.author}',
                           style:GoogleFonts.gemunuLibre(
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w400,
                            fontSize: 22.0,))
                        ]
                      ), 
                      const Spacer(),
                        Expanded(
                          child: Container(
                                               width:313.0,
                                               height:48.0,
                                               decoration:  BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color:const Color(0xff8249B5),
                          ),
                          borderRadius:const BorderRadius.only(
                            bottomLeft: Radius.circular(6),
                            bottomRight: Radius.circular(6),
                          )
                                               ),
                                               child:Row(
                           children: [
                            IconButton(
                              onPressed: (){
                                cubit.addQuoteToFavorites(model);
                              },
                               icon:const Icon(
                                Icons.favorite_border_outlined,
                                color: Color(0xff8249B5),
                               )),
                              Text('Add To Favorite',
                               style:GoogleFonts.gemunuLibre(
                              color: Color(0xff8249B5), 
                              fontWeight: FontWeight.w400, 
                              fontSize: 22.0,)),
                           ],
                                               )),
                        ),
                    
                    ],
                   ),
                  ),
      
      );
    }
  ),
);