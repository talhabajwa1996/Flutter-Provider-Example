import 'package:Assignment_1/src/notifiers/database_notifier.dart';
import 'package:Assignment_1/src/notifiers/view_notifier.dart';
import 'package:Assignment_1/src/views/wrapper_list_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Assigment 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(
        providers: [
          FutureProvider(
              create: (context) => DatabaseNotifier().fetchAllItems()),
          ChangeNotifierProvider(
            create: (context) => DatabaseNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => ViewNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => SortingNotifier(),
          ),
        ],
        child: WrapperListGrid(),
      ),
    );
  }
}
