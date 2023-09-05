import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../favorite/presentation/views/fav.dart';
import '../../../../search/presentation/views/search.dart';
import '../../../../welcome/presentation/views/welcome.dart';
import '../../../manager/cubit/cubit.dart';
import '../../../manager/cubit/states.dart';
import '../home.dart';


class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,State){
        var cubit=AppCubit.get(context);
      return Scaffold(
        backgroundColor:const Color(0xff8249B5),
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: size.width,
                height: 80,
                child: Stack(
                  children: [
                    CustomPaint(
                      size: Size(size.width, 80),
                      painter: BNBCustomPainter(),
                    ),
                    Center(
                      heightFactor: 0.6,
                      child: FloatingActionButton(backgroundColor: const Color(0xff8249B5), child: const Icon(Icons.quora_outlined), elevation: 0.1, onPressed: () {}),
                    ),
                    Container(
                      width: size.width,
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.format_quote_outlined,
                              color:cubit.currentIndex == 0 ?const Color(0xff8249B5) : Colors.grey.shade400,
                            ),
                            onPressed: () {
                             cubit.setBottomBarIndex(0);
                            },
                            splashColor: Colors.white,
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.home,
                                color: cubit.currentIndex == 1 ?const Color(0xff8249B5): Colors.grey.shade400,
                              ),
                              onPressed: () {
                               cubit.setBottomBarIndex(1);
                              }),
                          Container(
                            width: size.width * 0.20,
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color: cubit.currentIndex == 2 ? const Color(0xff8249B5): Colors.grey.shade400,
                              ),
                              onPressed: () {
                                cubit.setBottomBarIndex(2);
                              }),
                          IconButton(
                              icon: Icon(
                                Icons.search,
                                color: cubit.currentIndex == 3 ?const Color(0xff8249B5) : Colors.grey.shade400,
                              ),
                              onPressed: () {
                                cubit.setBottomBarIndex(3);
                              }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 80,
              child: IndexedStack(
                index: cubit.currentIndex,
                children: [
                  WelcomeScreen(),
                  const HomeScreen(),
                  const FavoriteScreen(),
                  SearchScreen(),
                  
                ],
              )),
          ],
        ),
      );
      }
    );
  }
}
class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20), radius: const Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}