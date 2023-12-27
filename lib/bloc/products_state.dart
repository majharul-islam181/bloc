import 'package:equatable/equatable.dart';
import 'package:test_bloc/models/product_model.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  final List<ProductsModel> productmodel;

  const ProductLoadedState(this.productmodel);
  @override
  List<Object> get props => [];
}

class ProductErrorState extends ProductState {
  final String errorMessage;

  const ProductErrorState(this.errorMessage);

    @override
  List<Object> get props => [];


}
