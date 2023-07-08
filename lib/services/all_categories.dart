import 'package:store_app/services/api_helper.dart';

class AllCategories {
  Future<List<dynamic>> getAllCategories() async {

    List<dynamic> data = await ApiHelper().getRequest(url: "https://fakestoreapi.com/products/categories");

    return data;
  }
}
