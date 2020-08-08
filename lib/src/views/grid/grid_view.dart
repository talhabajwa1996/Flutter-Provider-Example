import 'package:Assignment_1/src/notifiers/database_notifier.dart';
import 'package:flutter/material.dart';

class GridViewData extends StatelessWidget {
  final List<ItemViewModel> items;

  GridViewData({this.items});
  @override
  Widget build(BuildContext context) {
    return new GridView.builder(
      itemCount: this.items.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return new Card(
          child: Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 200,
                        child: Image.network(
                          this.items[index].image,
                        ),
                      ),
                      SizedBox(height: 5),
                      Center(
                        child: Text(
                          this.items[index].name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Price: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(this.items[index].price),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Creation Date: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(this.items[index].creationDate),
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(-1, -0.98),
                  child: Container(
                    height: 30,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Center(
                      child: Text(
                        "${this.items[index].discount} off",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}