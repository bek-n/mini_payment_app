import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class User {
  String name;
  String email;
  String image;

  User({
    required this.name,
    required this.email,
    required this.image,
  });
}

class ContactsPage extends StatelessWidget {
  ContactsPage({Key? key}) : super(key: key);

  final List<User> users = [
    User(
        name: 'Ahmed Ismail',
        image: 'ahmed.png',
        email: 'ahmed.ismail@gmail.com'),
    User(
        name: 'Sara Ibrahim',
        image: 'sara.png',
        email: 'sara.ibrahim@yahoo.com'),
    User(
        name: 'Ahmed Ibrahim',
        image: 'ahmed.png',
        email: 'ahmed_ibrahim@gmail.com'),
    User(
        name: 'Reem Khaled', image: 'reem.png', email: 'reem_khaled@yahoo.com'),
    User(name: 'Hiba Saleh', image: 'hiba.png', email: 'hiba_1993@gmail.com'),
    User(
        name: 'Sahar Fawzi',
        image: 'sahar.png',
        email: 'fawzi.sahar@yahoo.com'),
    User(
        name: 'Nisreen Ismail',
        image: 'nisreen.png',
        email: 'nisreen_5472@gmail.com'),
    User(
        name: 'Yara Khalil',
        image: 'yara.png',
        email: 'yara_khalil@hotmail.com'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(
            15.w,
          ),
          height: 102.h,
          width: 375.w,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.black.withOpacity(0.1),
                width: 1.h,
              ),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 24.w,
                height: 24.h,
              ),
              Text(
                "Contacts",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 24.w,
                height: 24.h,
                child: FittedBox(
                  child: SvgPicture.asset(
                    'assets/images/add_icon.svg',
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
       24.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Enter a name",
              hintStyle: TextStyle(
                fontSize: 14.sp,
                color: const Color(0xFF1A1A1A).withOpacity(0.3),
                fontWeight: FontWeight.w500,
              ),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: const ImageIcon(
                AssetImage('assets/images/search_icon.png'),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.w),
                borderSide: BorderSide(
                  color: const Color(0xFF1A1A1A).withOpacity(0.1),
                  width: 1.sp,
                ),
              ),
            ),
          ),
        ),
        24.verticalSpace,
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: SingleChildScrollView(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: users.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) =>  16.verticalSpace,
                itemBuilder: (context, index) => UserCard(
                  user: users[index],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

 
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 49.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20.w,
            backgroundColor: const Color(0xFFF3F4F5),
            backgroundImage: AssetImage("assets/images/${user.image}"),
          ),
         17.verticalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                user.name,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xFF1A1A1A),
                ),
              ),
              2.verticalSpace,
              Text(
                user.email,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: const Color(0xFF1A1A1A).withOpacity(0.4),
                ),
              )
            ],
          ),
          const Spacer(),
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.w),
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: Center(
              child: SizedBox(
                width: 20.w,
                height: 20.h,
                child: FittedBox(
                  child: SvgPicture.asset(
                    'assets/images/send_icon.svg',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        8.horizontalSpace,
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.w),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Center(
              child: SizedBox(
                width: 20.w,
                height: 20.h,
                child: FittedBox(
                  child: SvgPicture.asset(
                    'assets/images/request_icon.svg',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
