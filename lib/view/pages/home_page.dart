import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_payment_app/controller/user_controller.dart';
import 'package:mini_payment_app/view/components/zoom_tab_animation.dart';
import 'package:mini_payment_app/view/pages/all_history.dart';
import 'package:mini_payment_app/view/pages/card/add_card_page.dart';
import 'package:mini_payment_app/view/pages/card/cards_page.dart';
import 'package:mini_payment_app/view/pages/send_money_page.dart';
import 'package:mini_payment_app/view/style/style.dart';
import 'package:provider/provider.dart';
import '../../domain/model/user_model.dart';
import '../components/TriangleShape.dart';
import '../components/home_container.dart';
import '../components/home_last_transactions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserModel? info;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserController>().getUser();
      context.read<UserController>().getArxivs();
      FlutterNativeSplash.remove();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.read<UserController>();
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 262.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Style.darkBgcolorOfApp,
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
                        backgroundImage:
                            const AssetImage("assets/images/bmw.jpeg"),
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
                    "Hi, Bek N!",
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
                      AnimatedDigitWidget(
                        suffix: ' So\'m',
                        textStyle: Style.textStyleRegular(
                            size: 28, textColor: Style.secondary),
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.linear,
                        separateSymbol: '.',
                        enableSeparator: true,
                        value: context
                                .watch<UserController>()
                                .user
                                ?.totalBalance ??
                            0,
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
                              decoration: const BoxDecoration(
                                color: Style.secondary,
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
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const SendMoneyPage()));
                  },
                  child: ZoomTabAnimation(
                    child: Homecontainer(
                      icon: SvgPicture.asset(
                        "assets/svg/send_icon.svg",
                      ),
                      text: 'Send Money',
                      color: Style.secondary,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const CardsPage()));
                  },
                  child: ZoomTabAnimation(
                    child: Homecontainer(
                      icon: SvgPicture.asset(
                        "assets/svg/card_icon.svg",
                        // ignore: deprecated_member_use
                        color: Style.whiteColor,
                      ),
                      text: 'My Cards',
                      color: Style.primaryColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          25.verticalSpace,
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const AddCardPage()));
            },
            child: const ZoomTabAnimation(
              child: Homecontainer(
                icon: Icon(
                  Icons.add_card,
                  color: Colors.white,
                ),
                text: 'Add card',
                color: Style.primaryColor,
              ),
            ),
          ),
          32.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Last Transactions",
                    style: Theme.of(context).textTheme.bodySmall),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const AllHistory()));
                  },
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
          Expanded(
            child: AnimationLimiter(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.lstt.length,
                  itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        child: FadeInAnimation(
                          child: SlideAnimation(
                            child: LastTransactions(
                              date: state.lstt[index].date.substring(0, 16),
                              name: state.lstt[index].name,
                              summa: state.lstt[index].summa,
                            ),
                          ),
                        ),
                      ))),
            ),
          )
        ],
      ),
    );
  }
}
