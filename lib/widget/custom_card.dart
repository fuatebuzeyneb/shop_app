import 'package:flutter/material.dart';
import 'package:shop_app/model/product_model.dart';
import 'package:shop_app/view/product_update_view.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.products,
  });
  final ProductModel products;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductUpdateView.id, arguments: products);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Card(
            elevation: 5,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    products.title.substring(0, 10),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${products.price}',
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey.withOpacity(0.9)),
                      ),
                      const Icon(Icons.favorite),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: (size.width * 0.28) * 0.6,
            top: (size.width * 0.08) * -1,
            child: Image.network(
              products.image,
              height: 80,
              width: 80,
            ),
          ),
        ],
      ),
    );
  }
}
//          height: size.width * 0.3,
//          width: size.width * 0.45,