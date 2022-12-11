import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Utilities/size_config.dart';
import 'package:store/constants/colors.dart';
import 'package:store/presentation/bloc/transaction/transaction_bloc.dart';
import 'package:store/presentation/screens/checkout/components/payment_card.dart';
import 'package:store/presentation/screens/checkout/components/shipping_card.dart';
import 'package:store/presentation/screens/home/home_screen.dart';
import 'package:store/presentation/widgets/custom_page_transition.dart';
import 'package:store/presentation/widgets/default_button.dart';

class CheckoutBody extends StatelessWidget {
  const CheckoutBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.getProportionateScreenWidth(45)),
        child: ListView(
          children: [
            const ShippingCard(),
            const SizedBox(
              height: 25,
            ),
            const PaymentCard(),
            const SizedBox(
              height: 45,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Total",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontFamily: "Serif"),
                      ),
                      Text(
                        "\$254000",
                        style: TextStyle(
                          color: Color(0xff5956e9),
                          fontSize: 22,
                          fontFamily: "Raleway",
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                BlocListener<TransactionBloc, TransactionState>(
                  listener: (context, state) {
                    if (state is SuccessPostTransactionState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.successMessage),
                        ),
                      );
                      Navigator.of(context).pushAndRemoveUntil(
                          CustomPageTransition(child: const HomeScreen()),
                          (route) => false);
                    }
                    if (state is ErrorTransactionState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.errorMessage),
                        ),
                      );
                    }
                  },
                  child: DefaultButton(
                      text: "Confirm and Pay",
                      backgroundColor: primaryColor,
                      forgroundColor: Colors.white,
                      onPressed: () {
                        context
                            .read<TransactionBloc>()
                            .add(CreateTransactionEvent());
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
