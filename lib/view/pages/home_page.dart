import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_payment_app/view/style/style.dart';
import '../components/TriangleShape.dart';
import '../components/home_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 262.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              CustomPaint(
                size: Size(double.infinity, 262.h),
                painter: DrawTriangleShape(),
              ),
              Positioned(
                top: 48.h,
                width: 375.w,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Dashboard",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      CircleAvatar(
                        radius: 35.w,
                        backgroundImage: const NetworkImage(
                            "https://source.unsplash.com/random/1"),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 120.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Text(
                    "Hi, Amanda!",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 152.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Text(
                    "Total Balance",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 190.h,
                width: 375.w,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "\$124.57",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          SizedBox(
                            width: 24.w,
                            height: 24.h,
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: SvgPicture.asset(
                                "assets/svg/notifications_icon.svg",
                              ),
                            ),
                          ),
                          Positioned(
                            right: 3.07.w,
                            top: -4.h,
                            child: Container(
                              height: 10.h,
                              width: 10.w,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          32.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Homecontainer(
                    icon: SvgPicture.asset(
                      "assets/svg/send_icon.svg",
                    ),
                    text: 'Send Money',
                    color: Style.secondary,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Homecontainer(
                    icon: SvgPicture.asset(
                      "assets/svg/request_icon.svg",
                    ),
                    text: 'Request Money',
                    color: Style.primaryColor,
                  ),
                )
              ],
            ),
          ),
          32.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Last Transactions",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "View All",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
