import 'package:flutter/material.dart';

class CardInputScreen extends StatelessWidget {
  const CardInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Checkout Card Validator'),
          ),
          SliverFillRemaining(
            child: SingleChildScrollView(
              child: Placeholder(),
            ),
          )
        ],
      ),
    );
  }
}
