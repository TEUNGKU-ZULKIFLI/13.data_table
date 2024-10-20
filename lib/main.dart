import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// Membuat MODEL
class Name {
  String fName;
  String lName;

  Name(
      {required this.fName,
      required this.lName}); // Tambahkan 'required' untuk parameter wajib
}

// Data Model
var names = <Name>[
  Name(fName: "Zidni", lName: "Ridwan"),
  Name(fName: "Konsep", lName: "Koding"),
  Name(fName: "Hai", lName: "Na"),
  Name(fName: "Ahmad", lName: "Daglan"),
  Name(fName: "Kamui", lName: "Ridwan"),
  Name(fName: "Kina", lName: "Za"),
  Name(fName: "Aryi", lName: "Daman"),
  Name(fName: "Zidni", lName: "Ryi"),
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title})
      : super(key: key); // Menggunakan Key? dan required

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
      body: DataTable(
        columns: <DataColumn>[
          DataColumn(
            label: Text("Firstname"),
            onSort: (i, b) {
              setState(() {
                names.sort((a, b) => a.fName.compareTo(b.fName));
              });
            },
          ),
          DataColumn(
            label: Text("Lastname"),
            onSort: (i, b) {
              setState(() {
                names.sort((a, b) => a.lName.compareTo(b.lName));
              });
            },
          ),
        ],
        rows: names
            .map(
              (name) => DataRow(cells: [
                DataCell(
                  Text(name.fName),
                ),
                DataCell(Text(name.lName))
              ]),
            )
            .toList(),
      ),
    );
  }
}
