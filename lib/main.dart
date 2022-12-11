import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:store/presentation/bloc/login/login_bloc.dart';
import 'package:store/presentation/bloc/order/order_bloc.dart';
import 'package:store/presentation/bloc/product/product_bloc.dart';
import 'package:store/presentation/bloc/register/register_bloc.dart';
import 'package:store/presentation/bloc/transaction/transaction_bloc.dart';
import 'package:store/presentation/screens/splash/splash_screen.dart';
import 'constants/routes.dart';
import 'presentation/bloc/cart/cart_bloc.dart';
import 'presentation/bloc/search/search_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FavoriteBloc>(
          create: (_) => FavoriteBloc(),
        ),
        BlocProvider<SearchBloc>(
          create: (_) => SearchBloc(),
        ),
        BlocProvider<OrderBloc>(
          create: (_) => OrderBloc(),
        ),
        BlocProvider<CartBloc>(
          create: (_) => CartBloc(),
        ),
        BlocProvider<LoginBloc>(
          create: (_) => LoginBloc(),
        ),
        BlocProvider(
          create: (_) => RegisterBloc(),
        ),
        BlocProvider(
          create: (_) => ProductBloc(),
        ),
        BlocProvider(
          create: (_) => TransactionBloc(),
        ),
      ],
      child: MaterialApp(
          scrollBehavior: MaterialScrollBehavior().copyWith(
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
              PointerDeviceKind.stylus,
              PointerDeviceKind.unknown
            },
          ),
          debugShowCheckedModeBanner: false,
          title: 'STORE.ID',
          theme: ThemeData(fontFamily: 'Raleway'),
          initialRoute: SplashScreen.routeName,
          routes: routes),
    );
  }
}
