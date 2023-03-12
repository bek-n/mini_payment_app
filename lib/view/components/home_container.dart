import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../style/style.dart';

class Homecontainer extends StatelessWidget {
  final Widget icon;
  final String text;
  final Color color;
  const Homecontainer({super.key, required this.icon, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49.h,
      width: 165.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 21.w,
            height: 21.h,
            child: FittedBox(fit: BoxFit.fill, child: icon),
          ),
          4.horizontalSpace,
          Text(text, style: Style.textStyleRegular2(size: 14)),
        ],
      ),
    );
  }
}
