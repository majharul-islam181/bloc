import 'package:http/http.dart' as http;
import 'package:test_bloc/models/product_model.dart';

class ProductRepo {
  Future<List<ProductsModel>> getProducts() async{
      var response =
            await http.get(Uri.parse("https://fakestoreapi.com/products"));
        if (response.statusCode == 200) {
         return productsModelFromJson(response.body);
        } else {
          throw Exception("Failed to load Products");
        }
  }
}
