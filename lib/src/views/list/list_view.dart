import 'package:Assignment_1/src/notifiers/database_notifier.dart';
import 'package:flutter/material.dart';

class ListViewData extends StatelessWidget {
  final List<ItemViewModel> items;

  ListViewData({this.items});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.items.length,
      itemBuilder: (context, index) {
        return _listTile(this.items[index]);
      },
    );
  }

  Widget _listTile(ItemViewModel item) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 50.0,
            child: Center(child: Image.network(item.image)),
            backgroundColor: Colors.transparent,
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(item.name),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(item.brand),
                SizedBox(height: 5),
                Row(
                  children: <Widget>[
                    Text(
                      'Price: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(item.price),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: <Widget>[
                    Text(
                      'Discount: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(item.discount),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: <Widget>[
                    Text(
                      'Creation Date: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(item.creationDate),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
