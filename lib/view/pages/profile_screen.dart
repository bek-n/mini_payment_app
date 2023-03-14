import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_payment_app/view/components/profile.dart';
import 'package:mini_payment_app/view/pages/general/app_widget.dart';
import 'package:mini_payment_app/view/style/style.dart';

import '../../controller/local/local.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isAdimChangedTheme = true;
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
                        child: IconButton(
                            onPressed: () {
                              isAdimChangedTheme = !isAdimChangedTheme;
                              MyApp.of(context)!.change();
                              LocalStore.setTheme(isAdimChangedTheme);
                              setState(() {});
                            },
                            icon: Icon(
                                !isAdimChangedTheme
                                    ? Icons.dark_mode
                                    : Icons.light_mode,
                                color: Style.primaryColor))),
                  ],
                ),
                24.verticalSpace,
                CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 105, 105, 207),
                  radius: 50.w,
                  child: Center(
                    child: Text("B",
                        style: Style.textStyleRegular(
                            size: 40, textColor: Style.blackColor)),
                  ),
                ),
                8.verticalSpace,
                Text("Bek N", style: Style.textStyleRegular2()),
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
                  // ignore: deprecated_member_use
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
                  // ignore: deprecated_member_use
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
                  // ignore: deprecated_member_use
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
                  // ignore: deprecated_member_use
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
