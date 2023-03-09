import 'package:firebase_chat/features/welcome/presentation/widgets/page1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/welcome_cubit.dart';
import '../widgets/page2.dart';
import '../widgets/page3.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

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
                  controller: PageController(
                      initialPage: 0,
                      keepPage: false, //non tiene memoria della pagina
                      viewportFraction: 1),
                  reverse: false,
                  pageSnapping: true,
                  physics: const ClampingScrollPhysics(),
                  onPageChanged: (index) {
                    context.read<WelcomeCubit>().setIndex(index);
                  },
                  children: const [
                    Page1(),
                    Page2(),
                    Page3(),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
