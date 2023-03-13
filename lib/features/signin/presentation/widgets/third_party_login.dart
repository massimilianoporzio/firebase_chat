import 'package:firebase_chat/features/signin/presentation/cubit/signin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

import '../../../../core/config/style/app_color.dart';

class ThirdPartyLoginWidget extends StatelessWidget {
  const ThirdPartyLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      margin: EdgeInsets.only(bottom: 280.h),
      child: Column(
        children: [
          Text(
            "Sign in with social networks",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColor.primaryText,
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              height: 1,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 30.h,
              left: 50.w,
              right: 50.w,
            ),
            child: SocialLoginButton(
              backgroundColor: AppColor.socialButtonColor,
              width: 250.w,
              height: 55.h,
              textColor: AppColor.scaffoldBackground,
              borderRadius: 10,
              buttonType: SocialLoginButtonType.google,
              onPressed: () {
                context.read<SigninCubit>().handleSignIn();
              },
            ),
          )
        ],
      ),
    );
  }
}
