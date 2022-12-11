import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Utilities/size_config.dart';
import 'package:store/constants/colors.dart';
import 'package:store/domain/entites/product.dart';
import 'package:store/presentation/bloc/cart/cart_bloc.dart';
import 'package:store/presentation/bloc/cart/cart_event.dart';
import 'package:store/presentation/bloc/cart/cart_state.dart';
import 'package:store/presentation/widgets/default_button.dart';
import 'product_description.dart';
import 'product_images.dart';
import 'top_rounded_container.dart';

class DetailsScreenContent extends StatelessWidget {
  final ProductDetail product;
  const DetailsScreenContent({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImages(product: product),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                ProductDescription(product: product, onSeeMorePressed: () {}),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.getProportionateScreenHeight(8.0)),
                  child: BlocListener<CartBloc, CartState>(
                    listener: (context, state) {
                      if (state is CartItemAddedSuccessfulyState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.successMessage),
                            duration: const Duration(milliseconds: 500),
                          ),
                        );
                      }

                      if (state is CartErrorFetchDataState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.errorMessage),
                            duration: const Duration(milliseconds: 500),
                          ),
                        );
                      }
                    },
                    child: DefaultButton(
                      text: "Masukkan Keranjang",
                      backgroundColor: primaryColor,
                      forgroundColor: Colors.white,
                      onPressed: () {
                        context
                            .read<CartBloc>()
                            .add(AddToCart(productId: product.id));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
