import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
      return BlocConsumer<AppCubit,AppStates>(
      listener:(context,state){} ,
      builder:(context,state){
      return Scaffold(
         backgroundColor: Color(0xff8249B5),
         body: ListView.separated(
          itemBuilder: (context,index)=>itemBuilder(),
           separatorBuilder: ((context, index) =>const SizedBox(
            height: 5.0,
           )),
            itemCount: 2),
      );}
    );
  }
  
}
Widget itemBuilder()=> SingleChildScrollView(
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child:   Container(
      padding:EdgeInsets.all(20.0) ,
               width: double.infinity,
               height: 216.0,
               color:  Colors.white,
               child:Column(
                children: [
                  Text('“All I required to be happy was friendship and people I could admire.”',
                  style: GoogleFonts.gemunuLibre(
                    color: Color(0xff323232),
                    fontWeight: FontWeight.w400,
                    fontSize: 26.0,
                  ),), 
                  Row(
                    children:[
                      const Spacer(),
                      Text('Christian Dior',
                       style:GoogleFonts.gemunuLibre(
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w400,
                        fontSize: 22.0,))
                    ]
                  ), 
                  const Spacer(),
                    Container(
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
                        onPressed: (){},
                         icon:const Icon(
                          Icons.favorite_border_outlined,
                          color: Color(0xff8249B5),
                         )),
                        Text('Remove From Favorite',
                         style:GoogleFonts.gemunuLibre(
                        color: Color(0xff8249B5), 
                        fontWeight: FontWeight.w400, 
                        fontSize: 22.0,)),
                     ],
                   )),
                ],
               ),
              ),
  
  ),
);