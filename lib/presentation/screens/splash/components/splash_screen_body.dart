// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:store/constants/colors.dart';
import 'package:store/constants/text_style.dart';
import 'package:store/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:store/presentation/widgets/custom_button.dart';
import 'package:store/presentation/widgets/custom_page_transition.dart';

import '../../home/home_screen.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({Key? key}) : super(key: key);

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 2), vsync: this)
        ..repeat(reverse: true);
  late final Animation<double> _animation =
      CurvedAnimation(parent: _controller, curve: Curves.ease);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // To take all screen's height
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(gradient: primaryGradientColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Flexible(
              flex: 2,
              child:
                  Text("Enjoy Your\nShopping", style: splashHeadingTextStyle),
            ),
            Flexible(
              flex: 5,
              child: FadeTransition(
                opacity: _animation,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height *
                          0.5, // 50 percent of screen's height
                      child: Image.asset("assets/images/splash.png"),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: const BoxDecoration(color: primaryColor),
                    )
                  ],
                ),
              ),
            ),
            CustomButton(
              backgroundColor: Colors.white,
              forgroundColor: primaryColor,
              onPressed: () => Navigator.push(
                  context, CustomPageTransition(child: const SignInScreen())),
              title: "Get Started",
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  // override dispose method to release the memory of controller object after leaving the screen
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
