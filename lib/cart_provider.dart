import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:provider_project/item_model.dart';

class CartProvider extends ChangeNotifier {
  final Map<Item, int> items = {};
  late int itemCount;
  UnmodifiableMapView<Item, int> get cartItems => UnmodifiableMapView(items);

  double get price => items.entries.fold(
        0.0,
        (previousValue, element) =>
            previousValue + (element.key.price * element.value),
      );

  void addItem(Item item) {
    if (items.containsKey(item)) {
      items[item] = items[item]! + 1;
    } else {
      items[item] = 1;
    }
    notifyListeners();
  }

  void removeItem(Item item) {
    if (items.containsKey(item)) {
      if (items[item]! > 1) {
        items[item] = items[item]! - 1;
      } else {
        items.remove(item);
      }
      notifyListeners();
    }
  }

  void reset() {
    items.clear();
    notifyListeners();
  }

  int getCount(Item item) {
    return items[item] ?? 0;
  }

  int get totalItems {
    itemCount = 0;
    for (var item in items.values) {
      itemCount += item;
    }
    return itemCount;
  }
}
