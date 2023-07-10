import 'package:checkout/mixins/card_number_input_formatter.dart';
import 'package:checkout/src/widgets/screens/card_input_screen/card_input_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CardInputScreen extends StatelessWidget {
  CardInputScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CardInputScreenViewModel(),
      child: Consumer<CardInputScreenViewModel>(
        builder: (context, viewModel, child) {
          return Form(
            autovalidateMode: AutovalidateMode.always,
            key: _formKey,
            child: Scaffold(
              backgroundColor:
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      backgroundColor: Theme.of(context)
                          .bottomNavigationBarTheme
                          .backgroundColor,
                      title: const Text('Validate Bank Card'),
                    ),
                    SliverFillRemaining(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 24),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Card number is required';
                                }

                                viewModel.validateCardNumber(value);

                                if (viewModel.errorMessage != null) {
                                  return viewModel.errorMessage;
                                }

                                return null;
                              },
                              maxLength: 19,
                              maxLengthEnforcement: MaxLengthEnforcement
                                  .truncateAfterCompositionEnds,
                              keyboardType: TextInputType.number,
                              
                              inputFormatters: <TextInputFormatter>[
                                CardTextInputFormatter(),
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'^[0-9\s]*$'),
                                ),
                              ],
                              controller: viewModel.cardNumberController,
                              onChanged: (value) {
                                viewModel.validateCardNumber(value);
                              },
                              decoration: const InputDecoration(
                                label: Text('Credit card number'),
                                hintText: '0000 0000 0000 0000',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    keyboardType: TextInputType.datetime,
                                    decoration: const InputDecoration(
                                      label: Text('Expiry Date'),
                                      hintText: '10/26',
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.auto,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 6),
                                const Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      label: Text('CVV'),
                                      hintText: '123',
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.auto,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            DropdownButton(
                              items: CheckoutCardType.values
                                  .map(
                                    (value) =>
                                        DropdownMenuItem<CheckoutCardType>(
                                      value: value,
                                      child: Text(value.cardType),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {},
                            ),
                            const SizedBox(height: 12),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
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
            ),
          );
        },
      ),
    );
  }
}
