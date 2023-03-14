import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_payment_app/controller/user_controller.dart';
import 'package:mini_payment_app/view/pages/general/general_page.dart';
import 'package:mini_payment_app/view/style/style.dart';
import 'package:provider/provider.dart';
import '../../components/add_card_button.dart';
import '../../components/on_unfocused.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return AddCardPageState();
  }
}

class AddCardPageState extends State<AddCardPage> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  int index = 0;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    border = const OutlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xffAFB0B6),
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(12),
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.read<UserController>();
    return OnUnFocusTap(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Add Card',
            style:
                Style.textStyleRegular2(textColor: Style.whiteColor, size: 24),
          ),
          iconTheme: const IconThemeData(color: Style.whiteColor),
          backgroundColor: Style.blackColor,
        ),
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assets/images/bg.png'),
              fit: BoxFit.fill,
            ),
            color: Colors.black,
          ),
          child: Column(
            children: <Widget>[
              30.verticalSpace,
              CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                bankName: 'Davr Bank',
                frontCardBorder:
                    !useGlassMorphism ? Border.all(color: Colors.grey) : null,
                backCardBorder:
                    !useGlassMorphism ? Border.all(color: Colors.grey) : null,
                showBackView: isCvvFocused,
                obscureCardNumber: true,
                obscureCardCvv: true,
                isHolderNameVisible: true,
                cardBgColor: Style.blackColor,
                isSwipeGestureEnabled: true,
                onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
                customCardTypeIcons: <CustomCardTypeIcon>[
                  CustomCardTypeIcon(
                    cardType: CardType.mastercard,
                    cardImage: Image.asset(
                      'assets/images/master_card.png',
                      height: 48,
                      width: 48,
                    ),
                  ),
                ],
              ),
              10.verticalSpace,
              SizedBox(
                height: 100.h,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          this.index = index;
                          state.getColor(index);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(2),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                           image: DecorationImage(image: AssetImage(listOfImages[index]),
                            shape: BoxShape.circle,
                          ),
                        ),
                      );
                    }),
              ),
              10.verticalSpace,
              Column(
                children: <Widget>[
                  CreditCardForm(
                    formKey: formKey,
                    obscureCvv: true,
                    obscureNumber: true,
                    cardNumber: cardNumber,
                    cvvCode: cvvCode,
                    isHolderNameVisible: true,
                    isCardNumberVisible: true,
                    isExpiryDateVisible: true,
                    cardHolderName: cardHolderName,
                    expiryDate: expiryDate,
                    themeColor: Colors.blue,
                    textColor: Colors.white,
                    cardNumberDecoration: InputDecoration(
                      labelText: 'Number',
                      hintText: 'XXXX XXXX XXXX XXXX',
                      hintStyle: const TextStyle(color: Colors.white),
                      labelStyle: const TextStyle(color: Colors.white),
                      focusedBorder: border,
                      enabledBorder: border,
                      errorBorder: border,
                    ),
                    expiryDateDecoration: InputDecoration(
                      hintStyle: const TextStyle(color: Colors.white),
                      labelStyle: const TextStyle(color: Colors.white),
                      focusedBorder: border,
                      enabledBorder: border,
                      errorBorder: border,
                      labelText: 'Expired Date',
                      hintText: 'XX/XX',
                    ),
                    cvvCodeDecoration: InputDecoration(
                      hintStyle: const TextStyle(color: Colors.white),
                      labelStyle: const TextStyle(color: Colors.white),
                      focusedBorder: border,
                      enabledBorder: border,
                      errorBorder: border,
                      labelText: 'CVV',
                      hintText: 'XXX',
                    ),
                    cardHolderDecoration: InputDecoration(
                      hintStyle: const TextStyle(color: Colors.white),
                      labelStyle: const TextStyle(color: Colors.white),
                      focusedBorder: border,
                      enabledBorder: border,
                      errorBorder: border,
                      labelText: 'Card Holder',
                    ),
                    onCreditCardModelChange: onCreditCardModelChange,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  100.verticalSpace,
                  GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          state.createCard(
                              number: cardNumber,
                              cardHolder: cardHolderName,
                              cvv: cvvCode,
                              expiredDate: expiryDate,
                              onSuccess: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (_) => const GeneralPage()),
                                    (route) => false);
                              });
                        }
                      },
                      child: const ButtonAddCard()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
