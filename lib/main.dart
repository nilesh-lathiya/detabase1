import 'package:detabase1/second_page.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';




void main() {
  runApp(MaterialApp(
    home: detabase(),
  ));
}

class detabase extends StatefulWidget {
  const detabase({Key? key}) : super(key: key);

  @override
  State<detabase> createState() => _detabaseState();
}

class _detabaseState extends State<detabase> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  Database? database;

  @override
  void initState() {
    super.initState();
  }

  db_create() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE student (id INTEGER PRIMARY KEY, name TEXT, contact TEXT,city TExt)');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact")),
      body: Column(
        children: [
          Container(margin: EdgeInsets.all(10),
            child: TextField(
              controller: t1,
              cursorColor:Colors.blue,
              decoration: InputDecoration(
                hintText: "Enter your name",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ),
          Container(margin: EdgeInsets.all(10),
            child: TextField(
              controller: t2,
              cursorColor:Colors.blue,
              decoration: InputDecoration(
                hintText: "Enter Contact",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ),
          Container(margin: EdgeInsets.all(10),
            child: TextField(
              controller: t3,
              cursorColor:Colors.blue,
              decoration: InputDecoration(
                hintText: "Enter Your city",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ),


          ElevatedButton(
            onPressed: () {
              String str1 = t1.text;
              String str2 = t2.text;
              String str3 = t3.text;

              String qry =
                  "INSERT INTO student values(null,'$str1','$str2','$str3')";
              database!.rawInsert(qry);
            },
            child: Text("Submit"),
          ),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return second_page(database!);
            },));
          }, child: Text("View Data")),
        ],
      ),
    );
  }
}
