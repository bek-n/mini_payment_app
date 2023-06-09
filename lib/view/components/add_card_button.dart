import 'package:flutter/material.dart';
import 'package:mini_payment_app/controller/user_controller.dart';
import 'package:provider/provider.dart';
import '../style/style.dart';

class ButtonAddCard extends StatelessWidget {
  const ButtonAddCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: Style.linearGradient,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(vertical: 15),
      width: double.infinity,
      alignment: Alignment.center,
      child: context.watch<UserController>().cardLoading
          ? const Center(
              child: CircularProgressIndicator(
              color: Style.whiteColor,
            ))
          : Text('Add Card',
              style: Style.textStyleRegular(textColor: Style.whiteColor)),
    );
  }
}
