import 'package:flutter/material.dart';
import 'package:test_bloc/screens/product_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductScreen()));
          },
          child: const Text(
            "Get Products",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
