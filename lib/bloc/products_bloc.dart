// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

import 'package:test_bloc/bloc/products_event.dart';
import 'package:test_bloc/bloc/products_state.dart';
import 'package:test_bloc/models/product_model.dart';
import 'package:test_bloc/repo/product_repo.dart';

class ProductBloc extends Bloc<ProductLoadedEvent, ProductState> {
  final ProductRepo productRepo;

  ProductBloc(
    this.productRepo,
  ) : super(ProductLoadingState()) {
    on<ProductLoadedEvent>(((event, emit) async {
      try {
        emit(ProductLoadingState());

        var data = await productRepo.getProducts();

        emit(ProductLoadedState(data));

        // var response =
        //     await http.get(Uri.parse("https://fakestoreapi.com/products"));
        // if (response.statusCode == 200) {
        //   emit(ProductLoadedState(productsModelFromJson(response.body)));
        // } else {
        //   throw Exception("Failed to load Products");
        // }
      } catch (e) {
        emit(ProductErrorState(e.toString()));
      }
    }));
  }
}
