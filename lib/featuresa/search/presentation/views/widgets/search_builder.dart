
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../home/manager/cubit/cubit.dart';
import '../../../data/search_model.dart';

// ignore: must_be_immutable
class SearchBuilder extends StatelessWidget {
  SearchBuilder({super.key,required this.model});
  Results model;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
  child: Builder(
    builder: (context) {
       var cubit=AppCubit.get(context);
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child:   Container(
          padding:const EdgeInsets.all(20.0) ,
                   width: double.infinity,
                   height: 250.0,
                   color:  Colors.white,
                   child:Column(
                    children: [
                      Text('${model.content}',
                      style: GoogleFonts.gemunuLibre(
                        color: const Color(0xff323232),
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
                              color: const Color(0xff8249B5), 
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
}}