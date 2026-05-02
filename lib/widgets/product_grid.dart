import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';
import 'product_card.dart';

class ProductGrid extends StatelessWidget {
  final int? limit;
  final String? category;

  const ProductGrid({
    super.key,
    this.limit,
    this.category,
  });

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    List<Product> products;

    if (category != null) {
      products = productsProvider.getProductsByCategory(category!);
    } else {
      products = productsProvider.availableProducts;
    }

    if (limit != null && products.length > limit!) {
      products = products.sublist(0, limit!);
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder: (ctx, index) {
        return ProductCard(product: products[index]);
      },
    );
  }
}