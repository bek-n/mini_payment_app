import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../style/style.dart';

class TransactionCard extends StatelessWidget {
  final String name, date, summa;
  const TransactionCard(
      {super.key, required this.name, required this.date, required this.summa});

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
            backgroundImage: const AssetImage("assets/images/logo.png"),
          ),
          17.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              2.verticalSpace,
              Text(
                date,
                style: Theme.of(context).textTheme.titleSmall,
              )
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
              value: int.tryParse(summa),
            ),
          )
        ],
      ),
    );
  }
}
