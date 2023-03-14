import 'package:firebase_chat/core/config/style/values/app_shadows.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/style/app_style.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 84.h),
      width: 110.w,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            width: 76.w,
            height: 76.w,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 76.w,
                    decoration: const BoxDecoration(
                      color: AppColor.primaryBackground,
                      boxShadow: [
                        Shadows.primaryShadow,
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: Image.asset(
                    'assets/images/ic_launcher.png',
                    width: 76.w,
                    height: 76.w,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15.h),
            child: Text(
              "Let's chat",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColor.primaryText,
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
                height: 1,
              ),
            ),
          )
        ],
      ),
    );
  }
}
