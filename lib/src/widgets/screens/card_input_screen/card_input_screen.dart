import 'package:flutter/material.dart';

class CardInputScreen extends StatelessWidget {
  const CardInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text('Validate Bank Card'),
            ),
            SliverFillRemaining(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 24,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        label: Text('Full name'),
                        hintText: 'Tinashe Debugsdaily',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                    SizedBox(height: 12),
                    TextField(
                      decoration: InputDecoration(
                        label: Text('Credit card number'),
                        hintText: '0000 0000 0000 0000',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                    SizedBox(height: 12),
                    TextField(
                      decoration: InputDecoration(
                        label: Text('Full name'),
                        hintText: 'Tinashe Debugsdaily',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              label: Text('Expiry Date'),
                              hintText: '10/26',
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                            ),
                          ),
                        ),
                        SizedBox(width: 6),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              label: Text('CVV'),
                              hintText: '123',
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: MaterialButton(
        elevation: 0,
        color: Theme.of(context).primaryColor,
        onPressed: () {},
        child: Text(
          'SUBMIT FOR VALIDATION',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
