import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_chat/features/welcome/presentation/widgets/page1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/welcome_cubit.dart';
import '../widgets/page2.dart';
import '../widgets/page3.dart';

class WelcomePage extends StatelessWidget {
  final _pageController = PageController(
      initialPage: 0,
      keepPage: false, //non tiene memoria della pagina
      viewportFraction: 0.999); //per non vedere il "bianco"
  WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WelcomeCubit, WelcomeState>(
      builder: (context, state) {
        return Scaffold(
          body: SizedBox(
            width: 360.w, //cambiano i font e tutto in modo che resti come 360
            height: 780.w,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView(
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  reverse: false,
                  pageSnapping: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    context.read<WelcomeCubit>().setIndex(index);
                  },
                  children: const [
                    Page1(),
                    Page2(),
                    Page3(),
                  ],
                ),
                Positioned(
                  bottom: 70,
                  child: DotsIndicator(
                    onTap: (position) {
                      context.read<WelcomeCubit>().setIndex(position.toInt());
                      _pageController.jumpToPage(position.toInt());
                    },
                    position: state.index.toDouble(),
                    dotsCount: 3,
                    reversed: false,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                      size: const Size.square(9),
                      activeSize: const Size(18, 9),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
