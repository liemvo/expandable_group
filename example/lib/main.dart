import 'package:flutter/material.dart';
import 'package:expandable_group/expandable_group_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expandable Group demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
        title: 'Expandable Group demo',
        data: _generateData(),
      ),
    );
  }

  List<List<String>> _generateData() {
    int numberOfGroups = 5;
    List<List<String>> results = List<List<String>>();
    for (int i = 0; i < numberOfGroups; i++) {
      List<String> items = List<String>();
      for (int j = 0; j < numberOfGroups * 5 + i; j++) {
        items.add("Item $j in group $i");
      }
      results.add(items);
    }
    return results;
  }
}

class MyHomePage extends StatefulWidget {
  final List<List<String>> data;
  MyHomePage({Key key, this.title, this.data}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: widget.data.map((group) {
              int index = widget.data.indexOf(group);
              return ExpandableGroup(
                isExpanded: index == 0,
                header: _header('Group $index'),
                items: _buildItems(context, group),
                headerEdgeInsets: EdgeInsets.only(left: 16.0, right: 16.0),
              );
            }).toList(),
          )
        ],
      ),
    );
  }

  Widget _header(String name) => Text(name,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ));

  List<ListTile> _buildItems(BuildContext context, List<String> items) => items
      .map((e) => ListTile(
            title: Text(e),
          ))
      .toList();
}
