import 'package:Assignment_1/src/models/items.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class DatabaseService with ChangeNotifier {

  final CollectionReference itemsCollection =
      Firestore.instance.collection('items');

  Future<List<Items>> dataFromCloudFirestore() async {
    return await itemsCollection.getDocuments().then(
      (querySnapshot) {
        return querySnapshot.documents.map((doc) {
          return Items(
            name: doc.data['Name'] ?? '',
            brand: doc.data['Brand'] ?? '',
            price: doc.data['Price'] ?? '0',
            creationDate: doc.data['Creation_Date'] ?? '',
            image: doc.data['Image'] ?? '',
            discount: doc.data['Discount'] ?? '',
          );
        }).toList();
      },
    );
  }
}