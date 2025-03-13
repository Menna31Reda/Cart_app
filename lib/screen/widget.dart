import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/cart_provider.dart';
import 'package:provider_project/item_model.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    super.key,
    required this.item,
    this.isCartItem = false,
  });

  final Item item;
  final bool isCartItem;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context, listen: false);

    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(color: item.color),
      ),
      title: Text(item.name),
      subtitle: Text('${item.price} \$'),
      trailing: isCartItem
          ? null
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    provider.removeItem(item);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${item.name} removed from cart!'),
                        duration: const Duration(seconds: 2),
                        backgroundColor: Colors.red,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text("-"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Consumer<CartProvider>(
                    builder: (context, provider, child) {
                      int itemCount = provider.getCount(item);
                      return Text(
                        itemCount.toString(),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    provider.addItem(item);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${item.name} added to cart!'),
                        duration: const Duration(seconds: 2),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                  child: const Text("+"),
                ),
              ],
            ),
    );
  }
}
