import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_payment_app/controller/user_controller.dart';
import 'package:mini_payment_app/domain/card_model.dart';
import 'package:mini_payment_app/view/components/custom_textfromfiled.dart';
import 'package:mini_payment_app/view/components/delete_card_dialog.dart';
import 'package:mini_payment_app/view/components/my_cards.dart';
import 'package:mini_payment_app/view/pages/card/cards_page.dart';
import 'package:mini_payment_app/view/style/style.dart';
import 'package:provider/provider.dart';

class EditCard extends StatefulWidget {
  final CardModel list;
  final String docId;
  const EditCard({super.key, required this.list, required this.docId});

  @override
  State<EditCard> createState() => _EditCardState();
}

class _EditCardState extends State<EditCard> {
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController cvv = TextEditingController();
  TextEditingController expDate = TextEditingController();
  @override
  void initState() {
    name.text = widget.list.cardHolder;
    number.text = widget.list.number;
    cvv.text = widget.list.cvv;
    expDate.text = widget.list.expiredDate;
    super.initState();
  }

  @override
  void dispose() {
    name.dispose();
    number.dispose();
    cvv.dispose();
    expDate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.read<UserController>();
    final event = context.watch<UserController>();
    return Scaffold(
      appBar: AppBar(
        iconTheme:
            IconThemeData(color: Theme.of(context).unselectedWidgetColor),
        title:
            Text('Edit Card', style: Theme.of(context).textTheme.titleMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PaymentCard(
                  holderName: widget.list.cardHolder,
                  expDate: widget.list.expiredDate,
                  number: widget.list.number),
              30.verticalSpace,
              Text("Cardholder Name",
                  style: Theme.of(context).textTheme.titleSmall),
              8.verticalSpace,
              CustomTextFrom(
                style: Theme.of(context).textTheme.displaySmall,
                hintext: '',
                isObscure: false,
                controller: name,
              ),
              24.verticalSpace,
              Text("Card Number",
                  style: Theme.of(context).textTheme.titleSmall),
              8.verticalSpace,
              CustomTextFrom(
                style: Theme.of(context).textTheme.displaySmall,
                hintext: '',
                isObscure: false,
                controller: number,
              ),
              24.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("cvv/cvc",
                            style: Theme.of(context).textTheme.titleSmall),
                        8.verticalSpace,
                        CustomTextFrom(
                          style: Theme.of(context).textTheme.displaySmall,
                          hintext: '',
                          isObscure: false,
                          controller: cvv,
                        ),
                      ],
                    ),
                  ),
                  15.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Exp. Date",
                            style: Theme.of(context).textTheme.titleSmall),
                        8.verticalSpace,
                        CustomTextFrom(
                          style: Theme.of(context).textTheme.displaySmall,
                          hintext: '',
                          isObscure: false,
                          controller: expDate,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 81.h,
        width: 375.w,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.w),
            topRight: Radius.circular(20.w),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              offset: const Offset(0, -10),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                state.editCard(
                  onSuccess: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (_) => const CardsPage()),
                        (route) => false);
                  },
                  infos: CardModel(
                      cardHolder: name.text,
                      cvv: cvv.text,
                      expiredDate: expDate.text,
                      number: number.text,
                      cardId: widget.docId),
                );
              },
              child: Container(
                height: 49.h,
                width: 281.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.w),
                  color: Style.primaryColor,
                ),
                child: Center(
                  child: event.editLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: Style.whiteColor,
                        ))
                      : Text(
                          "Save Changes",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ),
            15.horizontalSpace,
            InkWell(
              onTap: () => _showConfimrationDialog(context),
              child: Container(
                height: 49.h,
                width: 49.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.w),
                  color: const Color(0xFFFB3640),
                ),
                child: Center(
                  child: SizedBox(
                    width: 24.w,
                    height: 24.h,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: SvgPicture.asset(
                        'assets/svg/remove_icon.svg',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
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
            child: DeleteCardDialog(
              id: widget.docId,
            )));
  }
}
