import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mini_payment_app/view/style/style.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Transactions',
          style: Style.textStyleRegular(size: 24),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            24.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Container(
                height: 57.h,
                width: 345.w,
                decoration: BoxDecoration(
                  gradient: Style.linearUserInfo,
                  borderRadius: BorderRadius.circular(15.w),
                ),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  padding: EdgeInsets.all(4.h),
                  indicator: BoxDecoration(
                    color: Style.secondary,
                    borderRadius: BorderRadius.circular(10.w),
                  ),
                  labelStyle: Style.textStyleRegular2(size: 14),
                  unselectedLabelColor: Style.darkBgcolorOfApp,
                  labelColor: Style.darkBgcolorOfApp,
                  tabs: const [
                    Tab(
                      child: Text("Incomes"),
                    ),
                    Tab(
                      child: Text("Expenses"),
                    ),
                  ],
                ),
              ),
            ),
            24.verticalSpace,
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "October, 2020",
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                      16.verticalSpace,
                      ListView.separated(
                        padding: EdgeInsets.zero,
                        itemCount: 1,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => 16.verticalSpace,
                        itemBuilder: (context, index) => TransactionCard(),
                      ),
                      24.verticalSpace,
                      Text(
                        "September, 2020",
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                      16.verticalSpace,
                      ListView.separated(
                        padding: EdgeInsets.zero,
                        itemCount: 3,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => 16.verticalSpace,
                        itemBuilder: (context, index) => TransactionCard(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionCard extends StatelessWidget {
  const TransactionCard({super.key});

  String formatCurrency(double amount) {
    final NumberFormat numberFormat = NumberFormat("#,##00.00", "en_US");
    return numberFormat.format(amount);
  }

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
            backgroundImage: AssetImage("assets/images/logo.png"),
          ),
          17.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Name',
                style: Style.textStyleRegular2(size: 14),
              ),
              2.verticalSpace,
              Text(
                "date and time",
                style: Style.textStyleRegular2(size: 12),
              )
            ],
          ),
          const Spacer(),
          // Text(
          //   transaction.transactionType == TransactionType.send
          //       ? "-\$${formatCurrency(transaction.amount)}"
          //       : "+\$${formatCurrency(transaction.amount)}",
          //   style: TextStyle(
          //     color: Colors.black,
          //     fontSize: 16.sp,
          //     fontWeight: FontWeight.w600,
          //   ),
          // )
        ],
      ),
    );
  }
}
