
import 'package:store_app/model/product_model.dart';
import 'package:store_app/services/api_helper.dart';

class CategoriesService {
  Future<List<ProductModel>> getCategoriesProducts(
      {required String categoriesName}) async {
    List<dynamic> data = await ApiHelper().getRequest(
        url: "https://fakestoreapi.com/products/category/$categoriesName");

    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(ProductModel.fromJson(data[i]));
    }
    return productsList;
  }
}
