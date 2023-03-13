import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:mini_payment_app/view/components/primary_button.dart';

class SendMoney extends StatelessWidget {
  const SendMoney({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 430.h,
      width: 327.w,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
        ),
        child: Column(
          children: [
            40.verticalSpace,
            SizedBox(
              width: 240.w,
              height: 180.h,
              child: FittedBox(
                fit: BoxFit.fill,
                child: LottieBuilder.asset('assets/images/send.json'),
              ),
            ),
            35.verticalSpace,
            Text(
              "The amount has been sent successfully!",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20.sp,
              ),
              textAlign: TextAlign.center,
            ),
            40.verticalSpace,
            const PrimaryButton(text: "Ok, Thanks")
          ],
        ),
      ),
    );
  }
}
