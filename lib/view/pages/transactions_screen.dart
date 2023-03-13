import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_payment_app/view/style/style.dart';
import 'package:provider/provider.dart';

import '../../controller/user_controller.dart';
import '../components/transaction_container.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.read<UserController>();
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
                        "March, 2023",
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                      16.verticalSpace,
                      SizedBox(
                        height: 500,
                        child: ListView.separated(
                          padding: EdgeInsets.zero,
                          itemCount: state.lstt.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) =>
                              16.verticalSpace,
                          itemBuilder: (context, index) => TransactionCard(
                            date: state.lstt[index].date.substring(0, 16),
                            name: state.lstt[index].name,
                            summa: state.lstt[index].summa,
                          ),
                        ),
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
