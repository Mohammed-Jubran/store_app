import 'package:store_app/model/product_model.dart';
import 'package:store_app/services/api_helper.dart';

class UpdateProduct {
  Future<ProductModel> updateProduct({
    required String title,
    required String price,
    required String desc,
    required String image,
    required String category,
  }) async {

    Map<String, dynamic> data = await ApiHelper().putRequest(
        url: "https://fakestoreapi.com/products/:id",
        body: {
          'title': title,
          'price': price,
          'description': desc,
          'image': image,
          'category': category,
        },
        token: null);
    return ProductModel.fromJson(data);
  }
}
