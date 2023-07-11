import 'package:checkout/mixins/card_number_input_formatter.dart';
import 'package:checkout/src/widgets/screens/card_input_screen/card_input_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
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
                            CreditCardWidget(
                              cardNumber: viewModel.cardNumberController.text,
                              expiryDate:
                                  viewModel.formattedDateController.text,
                              bankName: 'Checkout App',
                              cardBgColor: Theme.of(context).primaryColor,
                              cardHolderName: '',
                              obscureInitialCardNumber: true,
                              cvvCode: viewModel.cvvFieldController.text,
                              showBackView: viewModel.showCardBack,
                              onCreditCardWidgetChange: (p0) {},
                            ),
                            const SizedBox(height: 24),
                            TextFormField(
                              validator: (value) =>
                                  viewModel.validateCardNumber(value),
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
                                viewModel.validateCardNumber(
                                  value,
                                  validateLength: false,
                                );
                              },
                              decoration: InputDecoration(
                                label: const Text('Credit card number'),
                                hintText: '0000 0000 0000 0000',
                                suffixIcon: SizedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: viewModel.cardType?.getLogoAsset(32),
                                  ),
                                ),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: TextFormField(
                                    validator: viewModel.validateExpirationDate,
                                    controller:
                                        viewModel.formattedDateController,
                                    keyboardType: TextInputType.datetime,
                                    readOnly: true,
                                    onTap: () {
                                      viewModel.selectExpiryDate(context);
                                    },
                                    decoration: const InputDecoration(
                                      label: Text('Expiration Date'),
                                      hintText: '10/26',
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.auto,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: TextFormField(
                                    controller: viewModel.cvvFieldController,
                                    focusNode: viewModel.cardCVVFocusNode,
                                    decoration: const InputDecoration(
                                      label: Text('CVV'),
                                      hintText: '123',
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.auto,
                                    ),
                                  ),
                                ),
                              ],
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
                onPressed: () {
                  _formKey.currentState?.validate();
                  viewModel.saveCard();
                },
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
