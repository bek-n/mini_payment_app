import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_payment_app/view/components/custom_textfromfiled.dart';
import '../components/contacts_card.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contacts',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Column(
        children: [
          24.verticalSpace,
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: CustomTextFrom(
                style: Theme.of(context).textTheme.titleSmall,
                hintext: 'Enter a name',
                isObscure: false,
                suffixicon: const Icon(Icons.search),
              )),
          24.verticalSpace,
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: SingleChildScrollView(
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemCount: 1,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => 16.verticalSpace,
                  itemBuilder: (context, index) => const UserCard(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
