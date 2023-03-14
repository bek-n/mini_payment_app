import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_payment_app/controller/home_controller.dart';
import 'package:mini_payment_app/view/pages/home_page.dart';
import 'package:provider/provider.dart';
import '../../style/style.dart';
import '../contacts_screen.dart';
import '../profile_screen.dart';
import '../transactions_screen.dart';

class GeneralPage extends StatefulWidget {
  const GeneralPage({super.key});

  @override
  State<GeneralPage> createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {
  List<Widget> mainPages = [
    const HomePage(),
    const TransactionsPage(),
    const ContactsPage(),
    const ProfilePage()
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainPages[context.watch<HomeController>().currentIndex],
      backgroundColor:
          Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: SnakeNavigationBar.color(
        snakeViewColor: Style.primaryColor,
        // selectedItemColor: Style.primaryColor,
        unselectedItemColor: Style.greyColor90,
        currentIndex: context.watch<HomeController>().currentIndex,
        onTap: (value) {
          context.read<HomeController>().setIndex(value);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              size: 25,
              color: Theme.of(context).unselectedWidgetColor,
            ),
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
            'assets/svg/arrows_icon.svg',
            // ignore: deprecated_member_use
            color: Theme.of(context).unselectedWidgetColor,
          )),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
            'assets/svg/contacts_icon.svg',
            // ignore: deprecated_member_use
            color: Theme.of(context).unselectedWidgetColor,
          )),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
            'assets/svg/user_icon.svg',
            // ignore: deprecated_member_use
            color: Theme.of(context).unselectedWidgetColor,
          )),
        ],
      ),
    );
  }
}
