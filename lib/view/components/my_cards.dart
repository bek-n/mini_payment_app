import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_payment_app/view/style/style.dart';

class PaymentCard extends StatelessWidget {
  final String holderName, expDate, number;
  const PaymentCard(
      {Key? key,
      required this.holderName,
      required this.expDate,
      required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Container(
              margin: const EdgeInsets.only(bottom: 25),
              width: double.infinity,
              height: 220.h,
              decoration: BoxDecoration(
                color: Style.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned(
            left: 110.w,
            top: 100.h,
            child: SizedBox(
              width: 396.w,
              height: 128.h,
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: SvgPicture.asset(
                  'assets/svg/visa_logo.svg',
                ),
              ),
            ),
          ),
          SizedBox(
            width: 285.w,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 70.13.w,
                      height: 30.38.h,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: SvgPicture.asset(
                          'assets/svg/visa_logo_small.svg',
                        ),
                      ),
                    ),
                  ),
                  7.verticalSpace,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 35.w,
                      height: 26.h,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: SvgPicture.asset(
                          'assets/svg/visa_card_icon.svg',
                        ),
                      ),
                    ),
                  ),
                  18.verticalSpace,
                  Text(number,
                      style: Style.textStyleRegular(
                          size: 18, textColor: Style.whiteColor)),
                  23.verticalSpace,
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Cardholder",
                              style: Style.textStyleRegular2(
                                  textColor: Style.whiteColor)),
                          4.verticalSpace,
                          Text(holderName,
                              style: Style.textStyleRegular2(
                                  size: 12, textColor: Style.whiteColor)),
                        ],
                      ),
                      30.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Exp.Date",
                              style: Style.textStyleRegular2(
                                  textColor: Style.whiteColor)),
                          4.verticalSpace,
                          Text(expDate,
                              style: Style.textStyleRegular2(
                                  size: 12, textColor: Style.whiteColor)),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
