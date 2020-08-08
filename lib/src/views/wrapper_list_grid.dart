import 'package:Assignment_1/src/notifiers/database_notifier.dart';
import 'package:Assignment_1/src/notifiers/view_notifier.dart';
import 'package:Assignment_1/src/views/grid/grid_view.dart';
import 'package:Assignment_1/src/views/list/list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WrapperListGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemsList = Provider.of<List<ItemViewModel>>(context);
    final sortedItemsList = Provider.of<DatabaseNotifier>(context);
    final view = Provider.of<ViewNotifier>(context);
    return itemsList == null
        ? Scaffold(body: Center(child: CircularProgressIndicator()))
        : Stack(
            children: <Widget>[
              Scaffold(
                resizeToAvoidBottomPadding: false,
                body: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                        child: RaisedButton(
                          child:
                              Text(view.listView ? 'Grid View' : 'List View'),
                          onPressed: () {
                            view.toggleView();
                          },
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              if (constraints.maxWidth > 600) {
                                if (view.listView) {
                                  return ListViewData(items: itemsList);
                                } else {
                                  return GridViewData(items: itemsList);
                                }
                              } else {
                                if (!view.listView) {
                                  return GridViewData(items: itemsList);
                                } else {
                                  return ListViewData(items: itemsList);
                                }
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(1, 1),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                      onPressed: () {
                        _displayDialog(context, sortedItemsList, itemsList);
                      },
                      child: Icon(Icons.filter_list)),
                ),
              ),
            ],
          );
  }

  _displayDialog(BuildContext context, DatabaseNotifier sortedItemsList,
      List<ItemViewModel> listToSort) async {
    final sort = Provider.of<SortingNotifier>(context, listen: false);
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text('Sort By')),
          content: Container(
            height: 300,
            width: 100,
            child: Column(
              children: <Widget>[
                RadioListTile<SortingTypes>(
                  title: Text("Name"),
                  groupValue: sort.sortSelected,
                  value: SortingTypes.name,
                  onChanged: (SortingTypes val) {
                    sort.sortByName(val);
                    sortedItemsList.fetchAllItemsByName(listToSort);
                    Navigator.pop(context);
                  },
                ),
                RadioListTile(
                  title: Text("Price"),
                  groupValue: sort.sortSelected,
                  value: SortingTypes.price,
                  onChanged: (SortingTypes val) {
                    sort.sortByPrice(val);
                    sortedItemsList.fetchAllItemsByPrice(listToSort);
                    Navigator.pop(context);
                  },
                ),
                RadioListTile(
                  title: Text("Date"),
                  groupValue: sort.sortSelected,
                  value: SortingTypes.date,
                  onChanged: (SortingTypes val) {
                    sort.sortByDate(val);
                    sortedItemsList.fetchAllItemsByDate(listToSort);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}
