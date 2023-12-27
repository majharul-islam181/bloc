import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/bloc/products_bloc.dart';
import 'package:test_bloc/bloc/products_state.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
            if (state is ProductLoadingState) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is ProductLoadedState) {
              
              return ListView.builder(itemCount: 10,
                itemBuilder: (context, index) {
                
                return  ListTile(
                  leading: Text(state.productmodel[index].category.toString()),
                );
              });
            } else if (state is ProductErrorState) {
              return Center(
                child: Text(state.errorMessage),
              );
            }
            
            return const SizedBox();
      
          
        },
      ),
    );
  }
}
