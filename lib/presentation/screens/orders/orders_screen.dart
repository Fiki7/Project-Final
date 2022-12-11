import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/presentation/bloc/transaction/transaction_bloc.dart';
import 'package:store/presentation/widgets/custom_app_bar.dart';
import 'package:store/Utilities/size_config.dart';

import 'components/no_orders.dart';

class OrderScreen extends StatefulWidget {
  static const String routeName = "/order";
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => BlocProvider.of<TransactionBloc>(context, listen: false)
          .add(GetTransaction()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height +
            SizeConfig.getProportionateScreenHeight(40)),
        child: const CustomAppBar(
          title: "Orders History",
        ),
      ),
      body: SafeArea(
        child: BlocBuilder(
          bloc: BlocProvider.of<TransactionBloc>(context),
          builder: (BuildContext context, TransactionState state) {
            if (state is LoadingTransactionState) {
              return const Align(
                  alignment: Alignment.topCenter,
                  child: CircularProgressIndicator());
            }
            if (state is LoadedTransaction) {
              if (state.transactions.isEmpty) {
                return const NoOrder();
              } else {
                return Center(
                  child: Column(
                    children: [
                      Text(
                        "Found  ${state.transactions.length} results",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontFamily: "Raleway",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                );
              }
            }
            if (state is ErrorTransactionState) {
              return Center(
                child: Text(state.errorMessage),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
