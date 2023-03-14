import 'package:flutter/material.dart';
import 'package:mini_payment_app/controller/user_controller.dart';
import 'package:provider/provider.dart';

import '../components/home_last_transactions.dart';

class AllHistory extends StatelessWidget {
  const AllHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<UserController>();
    return Scaffold(
      body: Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: state.lstt.length,
            itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: LastTransactions(
                  date: state.lstt[index].date.substring(0, 16),
                  name: state.lstt[index].name,
                  summa: state.lstt[index].summa,
                ))),
      ),
    );
  }
}
