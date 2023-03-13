import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:mini_payment_app/controller/user_controller.dart';
import 'package:mini_payment_app/view/pages/card/add_card_page.dart';
import 'package:mini_payment_app/view/pages/card/edit_card.dart';
import 'package:mini_payment_app/view/pages/general/general_page.dart';
import 'package:mini_payment_app/view/style/style.dart';
import 'package:provider/provider.dart';
import '../../components/my_cards.dart';

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

    return Scaffold(
        appBar: AppBar(
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
          backgroundColor: Style.whiteColor,
          title: Text(
            'My Cards',
            style: Style.textStyleRegular(size: 24),
          ),
        ),
        backgroundColor: Colors.white,
        body: state.lst.isEmpty
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
                            itemBuilder: (context, index) => GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (_) => EditCard(
                                                  list: state.lst[index],
                                                  docId:
                                                      state.lst[index].cardId,
                                                )));
                                  },
                                  child: PaymentCard(
                                      holderName: state.lst[index].cardHolder,
                                      expDate: state.lst[index].expiredDate,
                                      number: state.lst[index].number),
                                ))),
                  ]));
  }
}
