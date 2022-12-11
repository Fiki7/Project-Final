import 'package:flutter/material.dart';
import 'package:store/Utilities/size_config.dart';
import 'package:store/constants/colors.dart';
import 'package:store/constants/text_style.dart';
import 'package:store/domain/entites/product.dart';

class ProductDescription extends StatelessWidget {
  final ProductDetail product;
  final GestureTapCallback? onSeeMorePressed;
  const ProductDescription(
      {Key? key, required this.product, this.onSeeMorePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product's title widget
          Padding(
            padding: EdgeInsets.only(
                bottom: SizeConfig.getProportionateScreenHeight(5)),
            child: Center(
              child: Text(
                product.name,
                style: productTitleStyle,
                
              ),
            ),
          ),

          // Product Description
          Container(
            margin: EdgeInsets.only(
                top: SizeConfig.getProportionateScreenHeight(10)),
            child: Padding(
              padding: EdgeInsets.only(
                left: SizeConfig.getProportionateScreenWidth(20),
                right: SizeConfig.getProportionateScreenWidth(64),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product's Headline
                 
                  // Product's description
                  Opacity(
                    opacity: 0.50,
                    child: Text(
                      product.deskripsi,
                      maxLines: 12,
                      style: productDescriptionStyle,
                    ),
                  ),
                  // See more details button
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.getProportionateScreenWidth(10)),
                    child: GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          const Text(
                            "Baca selengkapnya",
                            style: textStyle,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Icon(
                            Icons.arrow_forward_outlined,
                            size: SizeConfig.getProportionateScreenWidth(20),
                            color: primaryColor,
                            semanticLabel: "See More Details",
                          )
                        ],
                      ),
                    ),
                  ),
                  // Total Price
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total",
                            style: TextStyle(
                              fontSize:
                                  SizeConfig.getProportionateScreenWidth(14),
                              color: Colors.black,
                            )),
                        Text(
                          "\Rp.${product.harga}",
                          style: priceTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
