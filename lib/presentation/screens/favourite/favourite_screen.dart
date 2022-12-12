import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/presentation/bloc/favorite/favorite_event.dart';
import 'package:store/presentation/bloc/product/product_bloc.dart';
import 'package:store/presentation/widgets/custom_app_bar.dart';
import 'package:store/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:store/presentation/screens/favourite/components/no_favorite_item.dart';
import 'package:store/presentation/bloc/favorite/favorite_state.dart';
import 'package:store/presentation/screens/product_details/product_details_screen.dart';
import 'package:store/presentation/screens/search/components/item_card.dart';

class FavouriteScreen extends StatefulWidget {
  static const String routeName = "/favourite";
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    var bloc = BlocProvider.of<FavoriteBloc>(context);
    bloc.add(const FetchPopularProductEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: "Favorite Saya",
      ),
      body: SafeArea(
        child: BlocBuilder(
          bloc: BlocProvider.of<ProductBloc>(context),
          builder: (BuildContext context, ProductState state) {
            if (state is FavoriteLoadingState) {
              return const Align(
                  alignment: Alignment.topCenter,
                  child: CircularProgressIndicator());
            }
            if (state is ProductLoaded) {
              if (state.products.product.isEmpty) {
                return const NoFavorite();
              } else {
                return Center(
                    child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Wrap(
                          spacing: 15,
                          children: List.generate(
                            state.products.product.length,
                            (index) {
                              return ItemCard(
                                  image: state.products.product[index].image,
                                  price:
                                      "Rp ${state.products.product[index].harga}",
                                  title: state.products.product[index].name,
                                  evenItem: (index % 2 == 0) ? true : false,
                                  onTap: () => Navigator.pushNamed(
                                      context, ProductDetailsScreen.routeName,
                                      arguments:
                                          state.products.product[index]));
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ));
              }
            }
            if (state is ProductFailure) {
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
