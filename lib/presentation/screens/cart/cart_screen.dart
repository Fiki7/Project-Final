import 'package:flutter/material.dart';
import 'package:store/Utilities/size_config.dart';
import 'package:store/presentation/widgets/custom_app_bar.dart';
import 'components/cart_body.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height +
            SizeConfig.getProportionateScreenHeight(40)),
        child: CustomAppBar(
          title: "Keranjang Saya",
          icon: const Icon(
            Icons.restore_from_trash,
            color: Colors.redAccent,
          ),
          onIconTapped: () {},
        ),
      ),
      body: const CartBody(),
    );
  }
}
