import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_payment_app/view/components/custom_textfromfiled.dart';
import 'package:mini_payment_app/view/components/on_unfocused.dart';
import 'package:mini_payment_app/view/style/style.dart';
import 'package:lottie/lottie.dart';
import '../components/primary_button.dart';
import '../components/send_button.dart';

class SendMoneyPage extends StatelessWidget {
  const SendMoneyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnUnFocusTap(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Style.whiteColor,
          title: Text(
            'Send Money',
            style: Style.textStyleRegular(size: 24),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              24.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: const Color(0xFFF3F4F5),
                          radius: 30.w,
                          child: Center(
                            child: Text(
                              "Y",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                                color: const Color(0xFF1A1A1A),
                              ),
                            ),
                          ),
                        ),
                        12.horizontalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Yara Khalil",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: const Color(0xFF1A1A1A),
                              ),
                            ),
                            1.verticalSpace,
                            Text(
                              "yara_khalil@gmail.com",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: const Color(0xFF1A1A1A).withOpacity(0.4),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    32.verticalSpace,
                    const CustomTextFrom(
                      hintext: '',
                      isObscure: false,
                      label: 'Payment Amount',
                    ),
                    32.verticalSpace,
                    const CustomTextFrom(
                      numb: 8,
                      hintext: '',
                      isObscure: false,
                      label: 'Payment Note',
                    )
                  ],
                ),
              ),
              50.verticalSpace,
              GestureDetector(
                  onTap: () {
                    _showConfimrationDialog(context);
                  },
                  child: const SendMoneyButton())
            ],
          ),
        ),
      ),
    );
  }

  _showConfimrationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.w),
        ),
        child: SizedBox(
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
        ),
      ),
    );
  }
}
