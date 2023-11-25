import 'package:shop_app/helper/api.dart';
import 'package:shop_app/model/product_model.dart';

class UpdateProductServices {
  Future<ProductModel> updateProduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
    required int id,
  }) async {
    print('id = $id');
    Map<String, dynamic> data = await Api().put(
        url: 'https://fakestoreapi.com/products/$id',
        body: {
          'title': title,
          'price': price,
          'description': description,
          'image': image,
          'category': category,
        },
        token: '');
    return ProductModel.fromJson(data);
  }
}
