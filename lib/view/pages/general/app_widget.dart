import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../controller/home_controller.dart';
import '../../../controller/local.dart';
import '../../../controller/user_controller.dart';
import '../../style/style.dart';
import 'general_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isChangeTheme = true;

  @override
  void initState() {
    getTheme();
    super.initState();
  }

  getTheme() async {
    isChangeTheme = await LocalStore.getTheme();
    setState(() {});
  }

  void change() {
    isChangeTheme = !isChangeTheme;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => HomeController()),
              ChangeNotifierProvider(create: (context) => UserController()),
            ],
            child: MaterialApp(
              home: const GeneralPage(),
              theme: ThemeData(
                  appBarTheme:
                      const AppBarTheme(backgroundColor: Style.whiteColor),
                  unselectedWidgetColor: Style.blackColor,
                  primaryColor: Style.whiteColor,
                  useMaterial3: true,
                  scaffoldBackgroundColor: Style.whiteColor,
                  textTheme: TextTheme(
                    headlineLarge: Style.textStyleRegular(
                      size: 48,
                      textColor: Style.blackColor,
                    ),
                    titleMedium: Style.textStyleRegular(
                      size: 24,
                      textColor: const Color(0xff0D0D26),
                    ),
                    titleSmall: Style.textStyleRegular(
                      size: 14,
                      textColor: const Color(0xff0D0D26),
                    ),
                    bodySmall: Style.textStyleRegular(
                      size: 16,
                      textColor: const Color(0xff0D0D26),
                    ),
                    displayMedium: Style.textStyleRegular(
                      size: 28,
                      textColor: Style.blackColor,
                    ),
                    displayLarge: Style.textStyleRegular(
                      size: 34,
                      textColor: Style.blackColor,
                    ),
                    displaySmall: Style.textStyleRegular(
                      size: 17,
                      textColor: Style.blackColor,
                    ),
                    headlineSmall: Style.textStyleRegular2(
                      textColor: Style.blackColor,
                    ),
                  )),
              darkTheme: ThemeData(
                useMaterial3: true,
                unselectedWidgetColor: Style.whiteColor,
                appBarTheme:
                    const AppBarTheme(backgroundColor: Style.darkBgcolorOfApp),
                primaryColor: Style.darkBgcolorOfApp,
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    backgroundColor: Style.navBgcolorOfApp),
                textTheme: TextTheme(
                  headlineLarge: Style.textStyleRegular(
                    size: 48,
                    textColor: Style.whiteColor,
                  ),
                  titleMedium: Style.textStyleRegular(
                    size: 24,
                    textColor: Style.whiteColor,
                  ),
                  titleSmall: Style.textStyleRegular(
                    size: 14,
                    textColor: Style.whiteColor,
                  ),
                  bodySmall: Style.textStyleRegular(
                    size: 16,
                    textColor: Style.whiteColor,
                  ),
                  displayMedium: Style.textStyleRegular(
                    size: 28,
                    textColor: Style.whiteColor,
                  ),
                  displayLarge: Style.textStyleRegular(
                    size: 34,
                    textColor: Style.whiteColor,
                  ),
                  displaySmall: Style.textStyleRegular(
                    size: 17,
                    textColor: Style.whiteColor,
                  ),
                  headlineSmall: Style.textStyleRegular2(
                    textColor: Style.whiteColor,
                  ),
                ),
                scaffoldBackgroundColor: Style.darkBgcolorOfApp,
              ),
            ),
          );
        });
  }
}
