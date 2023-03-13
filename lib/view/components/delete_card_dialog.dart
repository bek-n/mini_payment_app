import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_payment_app/controller/user_controller.dart';
import 'package:mini_payment_app/view/pages/card/cards_page.dart';
import 'package:provider/provider.dart';

class DeleteCardDialog extends StatelessWidget {
  final String id;
  const DeleteCardDialog({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 373.h,
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
                child: SvgPicture.asset('assets/svg/remove_illustration.svg'),
              ),
            ),
            24.verticalSpace,
            Text(
              "Are you sure to remove this card?",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
              textAlign: TextAlign.center,
            ),
            40.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 49.h,
                    width: 148.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.w),
                      color: Colors.transparent,
                    ),
                    child: Center(
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.read<UserController>().deleteCard(
                        docId: id,
                        onSuccess: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (_) => const CardsPage()),
                              (route) => false);
                        });
                  },
                  child: Container(
                    height: 49.h,
                    width: 148.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.w),
                      color: const Color(0xFFFB3640),
                    ),
                    child: Center(
                      child: Text(
                        "Remove",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
