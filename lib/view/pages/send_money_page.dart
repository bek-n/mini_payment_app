import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_payment_app/controller/user_controller.dart';
import 'package:mini_payment_app/domain/model/user_model.dart';
import 'package:mini_payment_app/view/components/custom_textfromfiled.dart';
import 'package:mini_payment_app/view/components/on_unfocused.dart';
import 'package:provider/provider.dart';
import '../components/send_button.dart';
import '../components/send_money.dart';

class SendMoneyPage extends StatefulWidget {
  const SendMoneyPage({Key? key}) : super(key: key);

  @override
  State<SendMoneyPage> createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  late TextEditingController amount;
  late TextEditingController note;

  @override
  void initState() {
    amount = TextEditingController();
    note = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    amount.dispose();
    note.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OnUnFocusTap(
      child: Scaffold(
        appBar: AppBar(
          iconTheme:
              IconThemeData(color: Theme.of(context).unselectedWidgetColor),
          title: Text('Send Money',
              style: Theme.of(context).textTheme.titleMedium),
        ),
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
                              "S",
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
                            Text('Sardor',
                                style:
                                    Theme.of(context).textTheme.displaySmall),
                            2.verticalSpace,
                            Text('sardor@gmail.com',
                                style: Theme.of(context).textTheme.titleSmall)
                          ],
                        ),
                      ],
                    ),
                    32.verticalSpace,
                    CustomTextFrom(
                      style: Theme.of(context).textTheme.displaySmall,
                      controller: amount,
                      keyboardType: TextInputType.number,
                      hintext: 'Payment Amount',
                      isObscure: false,
                    ),
                    32.verticalSpace,
                    CustomTextFrom(
                      style: Theme.of(context).textTheme.displaySmall,
                      controller: note,
                      numb: 8,
                      hintext: 'Payment Note',
                      isObscure: false,
                    )
                  ],
                ),
              ),
              50.verticalSpace,
              GestureDetector(
                  onTap: () async {
                    await context.read<UserController>().sendMoney(
                        money: int.parse(amount.text),
                        infos: UserModel(
                            totalBalance: context
                                    .read<UserController>()
                                    .user
                                    ?.totalBalance ??
                                0));
                    // ignore: use_build_context_synchronously
                    context.read<UserController>().createArxiv(
                        date: DateTime.now().toString(),
                        name: 'Sardor',
                        comment: note.text,
                        summa: amount.text,
                        onSuccess: () {
                          _showConfimrationDialog(context);
                        });
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
          child: const SendMoney()),
    );
  }
}
