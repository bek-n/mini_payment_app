import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/style.dart';

class ProfileContainer extends StatelessWidget {
  final Widget icon, icon1;
  final String text;
  const ProfileContainer(
      {super.key, required this.icon, required this.text, required this.icon1});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      width: 375.w,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        gradient: Style.linearUserInfo,
        borderRadius: BorderRadius.circular(15.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 24.w,
            height: 24.h,
            child: FittedBox(fit: BoxFit.fill, child: icon),
          ),
          14.horizontalSpace,
          Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 24.w,
            height: 24.h,
            child: FittedBox(fit: BoxFit.fill, child: icon1),
          ),
        ],
      ),
    );
  }
}
