import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_payment_app/view/components/profile.dart';
import 'package:mini_payment_app/view/style/style.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: Style.linearUserInfo,
          ),
          height: 262.h,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                53.verticalSpace,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 24.w,
                      height: 24.h,
                    ),
                    Text(
                      "My Profile",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 24.w,
                      height: 24.h,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: SvgPicture.asset(
                          'assets/svg/edit_icon.svg',
                          // ignore: deprecated_member_use
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                24.verticalSpace,
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 84, 84, 192),
                  radius: 50.w,
                  child: Center(
                    child: Text("B",
                        style: Style.textStyleRegular(
                            size: 40, textColor: Style.blackColor)),
                  ),
                ),
                8.verticalSpace,
                Text(
                  "name",
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
        40.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              ProfileContainer(
                icon: SvgPicture.asset(
                  'assets/svg/profile_icon.svg',
                  // ignore: deprecated_member_use
                  color: Colors.black,
                ),
                text: 'My info',
                icon1: SvgPicture.asset(
                  'assets/svg/arrow_icon.svg',
                  color: Colors.black,
                ),
              ),
              16.verticalSpace,
              ProfileContainer(
                icon: SvgPicture.asset(
                  'assets/svg/card_icon.svg',
                  // ignore: deprecated_member_use
                  color: Colors.black,
                ),
                text: 'My Cards',
                icon1: SvgPicture.asset(
                  'assets/svg/arrow_icon.svg',
                  color: Colors.black,
                ),
              ),
              16.verticalSpace,
              ProfileContainer(
                icon: SvgPicture.asset(
                  'assets/svg/settings_icon.svg',
                  // ignore: deprecated_member_use
                  color: Colors.black,
                ),
                text: 'Settings',
                icon1: SvgPicture.asset(
                  'assets/svg/arrow_icon.svg',
                  color: Colors.black,
                ),
              ),
              16.verticalSpace,
              ProfileContainer(
                icon: SvgPicture.asset(
                  'assets/svg/help_icon.svg',
                  // ignore: deprecated_member_use
                  color: Colors.black,
                ),
                text: 'Help Center',
                icon1: SvgPicture.asset(
                  'assets/svg/arrow_icon.svg',
                  color: Colors.black,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}