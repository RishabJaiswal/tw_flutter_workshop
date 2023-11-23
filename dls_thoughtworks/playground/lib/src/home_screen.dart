import 'package:flutter/material.dart';
import 'package:playground/src/components_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ComponentsList(),
            ],
          ),
        ),
      ),
    );
  }
}
