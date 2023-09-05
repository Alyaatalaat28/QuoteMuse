

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../favorite/presentation/views/fav.dart';
import '../../../manager/cubit/cubit.dart';
import '../../../manager/cubit/states.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener:(context,state){} ,
      builder:(context,state){
        var cubit=AppCubit.get(context);
       return Scaffold(
        backgroundColor: const Color(0xff8249B5),
        body:ConditionalBuilder(
          condition: cubit.quotesModel!=null,
          builder:(context)=> Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 90.0,
                child: Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Container(
                       width: double.infinity,
                       height: 76.0,
                       decoration: const BoxDecoration(
                        color: Color(0xb2fbfbfb),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight:  Radius.circular(6),
                        ),
                       ),
                       child: Center(
                         child: TextButton(
                          onPressed:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const FavoriteScreen()));
                          },
                           child: Text('Click Here To View Favorite Quotes',
                           style: GoogleFonts.gemunuLibre(
                            color:const Color(0xff323232),
                            fontWeight: FontWeight.w400,
                            fontSize: 26.0,
                            
                           ),),
                         ),
                       ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 16.0,
                      child: Text('${cubit.quotes.length}',
                      style:GoogleFonts.gemunuLibre(
                        color: const Color(0xffFBFBFB),
                        fontSize: 22.0,
                        fontWeight: FontWeight.w400
                      ),),
                    ),
                  ],
                ),
              ),
             const  SizedBox(
                height: 5.0,
              ),
                   Container(
              padding:const EdgeInsets.all(20.0) ,
               width: double.infinity,
               height: 300.0,
               color:  Colors.white,
               child:Column(
                children: [
                  Text('${cubit.quotesModel!.content}',
                  style: GoogleFonts.gemunuLibre(
                    color: const Color(0xff323232),
                    fontWeight: FontWeight.w400,
                    fontSize: 26.0,
                  ),), 
                  const SizedBox(height:10.0),
                 
                  Row(
                    children:[
                      const Spacer(),
                      Text('${cubit.quotesModel!.author}',
                       style:GoogleFonts.gemunuLibre(
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w400,
                        fontSize: 22.0,))
                    ]
                  ), 
                  const Spacer(),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                           width:150.0,
                           height:48.0,
                           decoration: const BoxDecoration(
                            color: Color(0xff8249B5),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(6),
                            )
                           ),
                           child:TextButton(
                            onPressed: (){
                              cubit.getRandomQuotes();
                            },
                             child: Text('Generate Another Quote',
                             style:GoogleFonts.gemunuLibre(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 20.0,)))),
                        ), 
                          Expanded(
                            child: Container(
                              width:90.0 ,
                              height:48.0 ,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: const Color(0xff8249B5),
                                ),
                                borderRadius:const BorderRadius.only(
                                  bottomRight: Radius.circular(6),
                                )
                              ),
                              child: IconButton(
                                icon:const Icon(Icons.favorite,
                                color: Color(0xff8249B5),),
                              onPressed: (){
                                cubit.addQuoteToFavorites(cubit.quotesModel!);
                              },
                              )),
                          ),
                          
                          
                      ],
                    ),
                  ) 
                ],
               ),
                
              ),
            ],
            ),
          ),
          fallback: (context)=>const Center(child: CircularProgressIndicator()),
        ),
      );}
    );
  }
}