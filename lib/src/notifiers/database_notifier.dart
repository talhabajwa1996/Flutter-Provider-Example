import 'package:Assignment_1/src/models/items.dart';
import 'package:Assignment_1/src/services/database.dart';
import 'package:flutter/cupertino.dart';

class DatabaseNotifier extends ChangeNotifier {
  List<ItemViewModel> items;

  Future<List<ItemViewModel>> fetchAllItems() async {
    final items = await DatabaseService().dataFromCloudFirestore();
    this.items = items.map((item) => ItemViewModel(item: item)).toList();
    return this.items;
  }

  Future<void> fetchAllItemsByName(List<ItemViewModel> listToSortByName) async {
    listToSortByName.sort((a, b) => a.name.toString().compareTo(b.name.toString()));
    notifyListeners();
  }

  Future<void> fetchAllItemsByDate(List<ItemViewModel> listToSortByDate) async {
    listToSortByDate.sort((a, b) => a.creationDate.compareTo(b.creationDate));
    notifyListeners();
  }

  Future<void> fetchAllItemsByPrice(List<ItemViewModel> listToSortByPrice) async {
    listToSortByPrice.sort((a, b) => a.price.toString().compareTo(b.price.toString()));
    notifyListeners();
  }
}

class ItemViewModel {
  final Items item;

  ItemViewModel({this.item});

  String get name {
    return this.item.name;
  }

  String get brand {
    return this.item.brand;
  }

  String get creationDate {
    return this.item.creationDate;
  }

  String get image {
    return this.item.image;
  }

  String get price {
    return this.item.price;
  }

  String get discount {
    return this.item.discount;
  }
}
