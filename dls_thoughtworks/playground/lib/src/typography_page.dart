import 'package:flutter/material.dart';

class TypographyPage extends StatelessWidget {
  const TypographyPage({super.key});

  static const route = '/typography';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Typography'),
        elevation: 0,
      ),
      body: const SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Todo: DLS: Apply your typography and color
            Text(
              "large bold",
            ),
          ],
        ),
      ),
    );
  }
}

