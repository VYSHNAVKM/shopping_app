import 'package:flutter/material.dart';
import 'package:shopping_app/model/model.dart';

class ShoppingAppProvider extends ChangeNotifier {
  int selectedIndex = 0;
  //Categorylist
  List<String> categorylist = ['All', 'Men', 'Woman', 'Kids'];
  static final List<Items> _items = [
    Items(
        count: 0,
        images: 'assets/jpg/image1.jpeg',
        description:
            'Get the perfect mix of style, comfort and cuteness for your champ in this Grey Print Regular Collar shirt from Allen Solly Junior.'),
    Items(
        count: 0,
        images: 'assets/jpg/image2.jpeg',
        description:
            'Comfort, style, and convenience — these are certain things you can check off when exploring the variety of U.S. Polo Assn. shirts. You can find appropriate casual shirts to pair with jeans for a casual look or chinos to create a semi-formal look.'),
    Items(
        count: 0,
        images: 'assets/jpg/image3.jpeg',
        description:
            'Comfort, style, and convenience — these are certain things you can check off when exploring the variety of U.S. Polo Assn. shirts. You can find appropriate casual shirts to pair with jeans for a casual look or chinos to create a semi-formal look.'),
    Items(
        count: 0,
        images: 'assets/jpg/image4.jpeg',
        description:
            'Comfort, style, and convenience — these are certain things you can check off when exploring the variety of U.S. Polo Assn. shirts. You can find appropriate casual shirts to pair with jeans for a casual look or chinos to create a semi-formal look.'),
    Items(
        count: 0,
        images: 'assets/jpg/image5.jpeg',
        description:
            'Comfort, style, and convenience — these are certain things you can check off when exploring the variety of U.S. Polo Assn. shirts. You can find appropriate casual shirts to pair with jeans for a casual look or chinos to create a semi-formal look. '),
    Items(
        count: 0,
        images: 'assets/jpg/image6.jpeg',
        description:
            'Comfort, style, and convenience — these are certain things you can check off when exploring the variety of U.S. Polo Assn. shirts. You can find appropriate casual shirts to pair with jeans for a casual look or chinos to create a semi-formal look. '),
    Items(
        count: 0,
        images: 'assets/jpg/image7.jpeg',
        description:
            'Crafted from a lycra blend fabric, the VeBNoR Mens Regular Shirt offers enhanced comfort levels. Known for its stretchability, the fabric allows this shirt to conform to your bodys shape while still providing freedom of movement.'),
    Items(
        count: 0,
        images: 'assets/jpg/image8.jpeg',
        description:
            'Comfort, style, and convenience — these are certain things you can check off when exploring the variety of U.S. Polo Assn. shirts. You can find appropriate casual shirts to pair with jeans for a casual look or chinos to create a semi-formal look.'),
    Items(
        count: 0,
        images: 'assets/jpg/image9.jpeg',
        description:
            'Comfort, style, and convenience — these are certain things you can check off when exploring the variety of U.S. Polo Assn. shirts. You can find appropriate casual shirts to pair with jeans for a casual look or chinos to create a semi-formal look.'),
    Items(
        count: 0,
        images: 'assets/jpg/image10.jpeg',
        description:
            'Comfort, style, and convenience — these are certain things you can check off when exploring the variety of U.S. Polo Assn. shirts. You can find appropriate casual shirts to pair with jeans for a casual look or chinos to create a semi-formal look.'),
  ];
  List<Items> _cartItem = [];
  int _cartCount = 0;
  int _price = 0;

  List<Items> get items => _items;
  List<Items> get cartitems => _cartItem;
  int get itemCount => _items.length;
  int get cartitemCount => _cartItem.length;
  int get cartcount => _cartCount <= 0 ? 0 : _cartCount;
  int get price => _price;

  void addTocart(Items item) {
    if (_cartItem.contains(item)) {
      _cartItem[_cartItem.indexOf(item)].count++;
    } else {
      _cartItem.add(item);

      _cartItem[_cartItem.indexOf(item)].count = 1;

      _items[_items.indexOf(item)].count = 1;
    }

    _price = _price + 1500;

    _cartCount++;
    notifyListeners();
  }

  void removeFromcart(Items item) {
    if (_cartItem.contains(item) &&
        _cartItem[_cartItem.indexOf(item)].count == 1) {
      _items[_items.indexOf(item)].count = 0;

      _cartItem.remove(_cartItem[_cartItem.indexOf(item)]);

      _cartCount--;
    } else if (_cartItem[_cartItem.indexOf(item)].count > 0) {
      _cartItem[_cartItem.indexOf(item)].count--;
      _cartCount--;
    }

    _price = _price - 1500;
    notifyListeners();
  }

  void deleteFromCart(int index, Items item) {
    if (_cartItem.contains(item) &&
        _cartItem[_cartItem.indexOf(item)].count > 0) {
      _price = _price - (_cartItem[_cartItem.indexOf(item)].count * 2000);
      _cartCount -= _cartItem[_cartItem.indexOf(item)].count;
      _items[_items.indexOf(item)].count = 0;
      _cartItem[_cartItem.indexOf(item)].count = 0;
    }
    _cartItem.removeAt(index);
    notifyListeners();
  }
}
