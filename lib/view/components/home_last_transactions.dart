import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/style.dart';

class LastTransactions extends StatelessWidget {
  final String date, name, summa;
  const LastTransactions({
    super.key,
    required this.date,
    required this.name,
    required this.summa,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      height: 70.h,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: Style.linearUserInfo),
      child: Row(
        children: [
          15.horizontalSpace,
          CircleAvatar(
            radius: 20.w,
            backgroundColor: const Color(0xFFF3F4F5),
            backgroundImage: const AssetImage("assets/images/logo.png"),
          ),
          10.horizontalSpace,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                date,
                style: Style.textStyleRegular2(textColor: Style.whiteColor),
              ),
              Text(
                name,
                style: Style.textStyleRegular2(textColor: Style.whiteColor),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: AnimatedDigitWidget(
                suffix: ' So\'m',
                textStyle:
                    Style.textStyleRegular(size: 18, textColor: Colors.red),
                duration: const Duration(milliseconds: 800),
                curve: Curves.linear,
                separateSymbol: '.',
                enableSeparator: true,
                value: int.tryParse(summa) ?? 0),
          ),
        ],
      ),
    );
  }
}
