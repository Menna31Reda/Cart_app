import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/cart_provider.dart';
import 'package:provider_project/constants.dart';
import 'package:provider_project/screen/cart_screen/cart_screen.dart';
import 'package:provider_project/screen/item_list.dart';
import 'package:provider_project/screen/widget.dart';
import 'package:badges/badges.dart' as badges;

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text("Catalog"),
          centerTitle: true,
          actions: [
            Consumer<CartProvider>(builder: (context, provider, child) {
              provider.totalItems;
              return badges.Badge(
                position: badges.BadgePosition.topEnd(top: -5, end: -5),
                showBadge: (provider.itemCount) > 0,
                badgeContent: Text(
                  provider.itemCount.toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                badgeAnimation: const badges.BadgeAnimation.scale(
                  animationDuration: Duration(milliseconds: 300),
                  curve: Curves.easeOutBack,
                ),
                badgeStyle: badges.BadgeStyle(
                  shape: badges.BadgeShape.circle,
                  badgeColor: Colors.red,
                  padding: const EdgeInsets.all(6),
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.white, width: 2),
                ),
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart, size: 30),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CartScreen()));
                  },
                ),
              );
            }),
            const SizedBox(width: 20),
          ],
        ),
        body: ListView.builder(
            itemCount: catalog.length,
            itemBuilder: (context, index) {
              return ItemWidget(
                item: catalog[index],
              );
            }));
  }
}
