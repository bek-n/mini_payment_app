import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../style/style.dart';

class Homecontainer extends StatelessWidget {
  const Homecontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49.h,
      width: 165.w,
      decoration: BoxDecoration(
        color: Style.secondary,
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 21.w,
            height: 21.h,
            child: FittedBox(
              fit: BoxFit.fill,
              child: SvgPicture.asset(
                "assets/svg/send_icon.svg",
              ),
            ),
          ),
          4.horizontalSpace,
          Text(
            "Send Money",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
