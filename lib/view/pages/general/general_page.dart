import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:mini_payment_app/controller/home_controller.dart';
import 'package:mini_payment_app/view/pages/home_page.dart';
import 'package:provider/provider.dart';

import '../../style/style.dart';


class GeneralPage extends StatefulWidget {
  const GeneralPage({super.key});

  @override
  State<GeneralPage> createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {
  List<Widget> mainPages = [
    const HomePage(),
    const AddUserPage(),
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
              icon: Icon(
            Icons.group_add_sharp,
            size: 25,
            color: Theme.of(context).unselectedWidgetColor,
          )),
        ],
      ),
    );
  }
}
