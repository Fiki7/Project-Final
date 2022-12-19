import 'package:flutter/material.dart';

class ItemNotFound extends StatelessWidget {
  const ItemNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            child: Image.asset(
              "assets/images/element_not_found.png",
              fit: BoxFit.contain,
            ),
          ),
          const Text(
            "Produk Tidak Ditemukan",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontFamily: "Raleway",
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Opacity(
            opacity: 0.57,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "Silahkan masukan kata kunci yang lain.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
