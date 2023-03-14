import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 49.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20.w,
            backgroundColor: const Color(0xFFF3F4F5),
            backgroundImage:
                const NetworkImage("https://source.unsplash.com/random/2"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sardor',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                2.verticalSpace,
                Text(
                  'sardor@gmail.com',
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ],
            ),
          ),
          const Spacer(),
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.w),
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: Center(
              child: SizedBox(
                width: 20.w,
                height: 20.h,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: SvgPicture.asset(
                    'assets/svg/send_icon.svg',
                  ),
                ),
              ),
            ),
          ),
          8.horizontalSpace,
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.w),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Center(
              child: SizedBox(
                width: 20.w,
                height: 20.h,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: SvgPicture.asset(
                    'assets/svg/request_icon.svg',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
