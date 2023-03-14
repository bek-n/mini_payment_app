import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:mini_payment_app/controller/user_controller.dart';
import 'package:mini_payment_app/view/pages/card/add_card_page.dart';
import 'package:mini_payment_app/view/pages/card/edit_card.dart';
import 'package:mini_payment_app/view/pages/general/general_page.dart';
import 'package:mini_payment_app/view/style/style.dart';
import 'package:provider/provider.dart';

class CardsPage extends StatefulWidget {
  const CardsPage({Key? key}) : super(key: key);

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserController>().getCards();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.read<UserController>();
    final event = context.watch<UserController>();

    return Scaffold(
        appBar: AppBar(
          iconTheme:
              IconThemeData(color: Theme.of(context).unselectedWidgetColor),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const GeneralPage()),
                    (route) => false);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const AddCardPage()));
                  },
                  child: SvgPicture.asset('assets/svg/add_icon.svg')),
            )
          ],
          title:
              Text('My Cards', style: Theme.of(context).textTheme.titleMedium),
        ),
        body: event.createCardLoading
            ? const Center(child: CircularProgressIndicator())
            : state.lst.isEmpty
                ? Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LottieBuilder.asset('assets/images/no.json'),
                      Text(
                        'No Cards yet',
                        style: Style.textStyleRegular(),
                      )
                    ],
                  ))
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        24.verticalSpace,
                        Expanded(
                            child: ListView.builder(
                                itemCount: state.lst.length,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                                  builder: (_) => EditCard(
                                                        list: state.lst[index],
                                                        docId: state
                                                            .lst[index].cardId,
                                                      )));
                                        },
                                        child: CreditCardWidget(
                                          backgroundImage:
                                              event.lst[index].index ==
                                                      event.images[index]
                                                  ? event.image
                                                  : null,
                                          isHolderNameVisible: true,
                                          bankName: 'Davr Bank',
                                          cardNumber: state.lst[index].number,
                                          expiryDate:
                                              state.lst[index].expiredDate,
                                          cardHolderName:
                                              state.lst[index].cardHolder,
                                          cvvCode: state.lst[index].cvv,
                                          showBackView: false,
                                          onCreditCardWidgetChange:
                                              // ignore: non_constant_identifier_names
                                              (CreditCardBrand) {},
                                        )))),
                      ]));
  }
}
