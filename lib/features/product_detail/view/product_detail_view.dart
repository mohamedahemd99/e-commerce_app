import 'package:ecommerce_app/core/components/buttons/primary_expansion_tile.dart';
import 'package:ecommerce_app/core/constants/application_constants.dart';
import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:ecommerce_app/core/extensions/string_case_extension.dart';
import 'package:ecommerce_app/core/utils/lang/generated/locale_keys.g.dart';
import 'package:ecommerce_app/product/components/buttons/favorite_button.dart';
import 'package:ecommerce_app/product/components/product_rating_bar.dart';
import 'package:ecommerce_app/product/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({Key? key, required this.product}) : super(key: key);
  static const id = '/productDetail';
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      appBar: _buildAppBar(context),
      body: Stack(
        children: [
          SingleChildScrollView(
              child: Column(
            children: [
              _buildImage(context),
              _buildActions(context),
              _buildDetails(context),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 100,
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: context.colors.secondary,
      foregroundColor: context.colors.onBackground,
      title: Text(
        product.title!,
      ),
    );
  }

  Image _buildImage(BuildContext context) {
    return Image.network(
      height: 300,
      product.image ?? ApplicationConstants.dummyImage,
      fit: BoxFit.fitWidth,
    );
  }

  Row _buildActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        // const PrimaryDropdownButton(
        //   items: ['Small', 'Medium', 'Large'],
        // ),
        FavoriteButton(
          iconColor: context.colors.onPrimary,
          productModel: product,
        ),
      ],
    );
  }

  Padding _buildDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: _buildTitle(context),
              subtitle: _buildCategory(),
              trailing: _buildPrice(context),
            ),
          ),
          const SizedBox(height: 15),
          _buildRating(context),
          const SizedBox(height: 15),
          _buildDescription(),
          const PrimaryExpansionTile(LocaleKeys.product_detail_shipping_info),
          const PrimaryExpansionTile(LocaleKeys.product_detail_support),
        ],
      ),
    );
  }

  Text _buildTitle(BuildContext context) {
    return Text(
      '${product.title!.split(' ')[0]} ${product.title!.split(' ')[1]} ${product.title!.split(' ')[2]} ',
      style: context.textTheme.headline6,
    );
  }

  Text _buildCategory() {
    return Text(
      product.category!.toTitleCase(),
    );
  }

  Text _buildPrice(BuildContext context) {
    return Text(
      '\$${product.price}',
      style: context.textTheme.headline6,
    );
  }

  ProductRatingBar _buildRating(BuildContext context) {
    return ProductRatingBar(product: product);
  }

  Text _buildDescription() => Text('${product.description}');
}
