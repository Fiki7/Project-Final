import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/presentation/bloc/cart/cart_bloc.dart';
import 'package:store/presentation/bloc/cart/cart_event.dart';
import 'package:store/presentation/bloc/cart/cart_state.dart';
import 'package:store/presentation/screens/cart/components/no_items_found.dart';
import 'package:store/presentation/widgets/banner.dart';
import 'package:store/Utilities/size_config.dart';
import 'package:store/constants/colors.dart';
import 'package:store/presentation/screens/checkout/checkout_screen.dart';
import 'package:store/presentation/widgets/custom_page_transition.dart';
import 'package:store/presentation/widgets/default_button.dart';

import 'cart_card.dart';

class CartBody extends StatefulWidget {
  const CartBody({Key? key}) : super(key: key);

  @override
  _CartBodyState createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => BlocProvider.of<CartBloc>(context, listen: false).add(GetCart()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.getProportionateScreenWidth(20)),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const CustomBanner(
                  text: "Dapatkan gratis ongkir di event 12.12",
                  backgroundColor: Color(0xffd3f1ff),
                ),

                // List of cart's products
                Flexible(
                  flex: 3,
                  child: (state is CartSuccessFetchDataState &&
                          state.cartItems.isNotEmpty)
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: ListView.builder(
                              itemCount: state.cartItems.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Container(
                                    color: Colors.white,
                                    child: Dismissible(
                                      key: Key(
                                          state.cartItems[index].id.toString()),
                                      direction: DismissDirection.endToStart,
                                      onDismissed: (direction) {},
                                      background: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFFFE6E6),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Row(
                                          children: const [
                                            Spacer(),
                                            Icon(
                                              Icons.restore_from_trash,
                                              color: Colors.redAccent,
                                            )
                                          ],
                                        ),
                                      ),
                                      child: CartItemCard(
                                          cartItem: state.cartItems[index],
                                          itemIndex: index),
                                    ),
                                  ),
                                );
                              }),
                        )
                      : const NoItemsFound(),
                ),
                const SizedBox(
                  height: 45,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontFamily: "Serif"),
                          ),
                          Text(
                            state is CartSuccessFetchDataState
                                ? "Rp. ${state.total}"
                                : "Rp. 0",
                            style: TextStyle(
                              color: Color(0xff5956e9),
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    DefaultButton(
                      text: "Checkout",
                      backgroundColor: primaryColor,
                      forgroundColor: Colors.white,
                      onPressed: () => Navigator.push(context,
                          CustomPageTransition(child: const CheckoutScreen())),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
