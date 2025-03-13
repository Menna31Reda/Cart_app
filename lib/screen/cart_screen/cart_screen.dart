import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/cart_provider.dart';
import 'package:provider_project/screen/widget.dart';

import '../../constants.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('cart'),
          centerTitle: true,
          backgroundColor: primaryColor,
        ),
        body: Consumer<CartProvider>(
          builder: (context, provider, child) => Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: provider.cartItems.length,
                    itemBuilder: (context, index) => ItemWidget(
                          item: provider.cartItems.keys.elementAt(index),
                        )),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 100,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: primaryColor),
                    onPressed: () {},
                    child: Text('buy ${provider.price}')),
              ),
            ],
          ),
        ));
  }
}
