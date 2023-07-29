import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff8249B5),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 90.0,
            child: Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Container(
                   width: double.infinity,
                   height: 76.0,
                   decoration: BoxDecoration(
                    color: Color(0xb2fbfbfb),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight:  Radius.circular(6),
                    ),
                   ),
                   child: Center(
                     child: Text('Click Here To View Favorite Quotes',
                     style: GoogleFonts.gemunuLibre(
                      color:Color(0xff323232),
                      fontWeight: FontWeight.w400,
                      fontSize: 26.0,
                      
                     ),),
                   ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 16.0,
                  child: Text('2',
                  style:GoogleFonts.gemunuLibre(
                    color: Color(0xffFBFBFB),
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
              const SizedBox(height: 5.0,),
              Row(
                children: [
                  Container(
                   width:203.0,
                   height:48.0,
                   decoration: const BoxDecoration(
                    color: Color(0xff8249B5),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(6),
                    )
                   ),
                   child:TextButton(
                    onPressed: (){},
                     child: Text('Generate Another Quote',
                     style:GoogleFonts.gemunuLibre(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 20.0,)))),
                    const Spacer(),
                    Container(
                      width:100.0 ,
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
                      onPressed: (){},
                      )),
                    
                ],
              ) 
            ],
           ),
            
          ),
        ],
        ),
      ),
    );
  }
}