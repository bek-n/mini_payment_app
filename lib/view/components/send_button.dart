import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_payment_app/controller/user_controller.dart';
import 'package:mini_payment_app/view/style/style.dart';
import 'package:provider/provider.dart';

class SendMoneyButton extends StatelessWidget {
  const SendMoneyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49.h,
      width: 345.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.w),
          gradient: Style.linearGradient),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          context.watch<UserController>().sendLoading ||
                  context.watch<UserController>().createarxivLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Style.whiteColor,
                ))
              : SizedBox(
                  width: 21.w,
                  height: 21.h,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: SvgPicture.asset(
                      "assets/svg/send_icon.svg",
                      // ignore: deprecated_member_use
                      color: Style.whiteColor,
                    ),
                  ),
                ),
          4.horizontalSpace,
          Text("Send Payment",
              style: Style.textStyleRegular(
                  size: 14, textColor: Style.whiteColor)),
        ],
      ),
    );
  }
}
