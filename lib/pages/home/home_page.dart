import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/product_provider.dart';
import 'package:flutter_application_1/widgets/product_card.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getInit();

    super.initState();
  }

  getInit() async {
    await Provider.of<ProductProvider>(context, listen: false).getProducts();
    // Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    // AuthProvider authProvider = Provider.of<AuthProvider>(context);
    // UserModel user = authProvider.user;
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    // Widget header() {
    //   return Container(
    //     margin: EdgeInsets.only(
    //       top: defaultMargin,
    //       left: defaultMargin,
    //       right: defaultMargin,
    //     ),
    //     child: Row(
    //       children: [
    //         Expanded(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 'Hallo, ${user.name}',
    //                 style: primaryTextStyle.copyWith(
    //                   fontSize: 24,
    //                   fontWeight: semiBold,
    //                 ),
    //               ),
    //               Text(
    //                 '@${user.username}',
    //                 style: subtitleTextStyle.copyWith(
    //                   fontSize: 16,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         Container(
    //           width: 54,
    //           height: 54,
    //           decoration: BoxDecoration(
    //             shape: BoxShape.circle,
    //             image: DecorationImage(
    //               image: NetworkImage(
    //                 user.profilePhotoUrl!,
    //               ),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   );
    // }

    Widget popularProductsTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Popular Products',
          style: primaryTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    // Widget popularProducts() {
    //   return StaggeredGridView.countBuilder(
    //     crossAxisCount: 4,
    //     mainAxisSpacing: 4,
    //     crossAxisSpacing: 20,
    //     itemBuilder: (context, index) {
    //       var product = productProvider.products;
    //       return ProductCard(product);
    //     },
    //     staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
    //   );
    // }

    Widget popularProducts() {
      return Container(
        margin: const EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Row(
                children: productProvider.products
                    .map(
                      (product) => ProductCard(product),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      );
    }

    // Widget newArrivalsTitle() {
    //   return Container(
    //     margin: EdgeInsets.only(
    //       top: defaultMargin,
    //       left: defaultMargin,
    //       right: defaultMargin,
    //     ),
    //     child: Text(
    //       'New Arrivals',
    //       style: primaryTextStyle.copyWith(
    //         fontSize: 22,
    //         fontWeight: semiBold,
    //       ),
    //     ),
    //   );
    // }

    // Widget newArrivals() {
    //   return Container(
    //     margin: const EdgeInsets.only(
    //       top: 14,
    //     ),
    //     child: Column(
    //       children: productProvider.products
    //           .map(
    //             (product) => ProductTile(product),
    //           )
    //           .toList(),
    //     ),
    //   );
    // }

    return ListView(
      children: [
        // header(),
        // categories(),
        popularProductsTitle(),
        popularProducts(),
        // newArrivalsTitle(),
        // newArrivals(),
      ],
    );
  }
}
