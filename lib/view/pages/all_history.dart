import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mini_payment_app/controller/user_controller.dart';
import 'package:provider/provider.dart';
import '../components/home_last_transactions.dart';

class AllHistory extends StatelessWidget {
  const AllHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<UserController>();
    return Scaffold(
      appBar: AppBar(
        iconTheme:
            IconThemeData(color: Theme.of(context).unselectedWidgetColor),
        title: Text(
          'Transaction History',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: AnimationLimiter(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: state.lstt.length,
              itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    child: FadeInAnimation(
                      child: SlideAnimation(
                        child: LastTransactions(
                          date: state.lstt[index].date.substring(0, 16),
                          name: state.lstt[index].name,
                          summa: state.lstt[index].summa,
                        ),
                      ),
                    ),
                  ))),
        ),
      ),
    );
  }
}
