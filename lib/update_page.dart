import 'package:detabase1/second_page.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class update_page extends StatefulWidget {
  Database database;
  int id;

  update_page(this.database, this.id);

  @override
  State<update_page> createState() => _update_pageState();
}

class _update_pageState extends State<update_page> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  String name = "";
  String contact = "";
  String city = "";

  @override
  void initState() {
    super.initState();
    get_data();
  }

  get_data() async {
    String sql = "select * form student where id=${widget.id}";
    List<Map> l = await widget.database.rawQuery(sql);
    l.forEach((element) {
      name = element['name'];
      contact = element['contact'];
      city = element['city'];
    });
    setState() {
      t1.text = name;
      t2.text = contact;
      t3.text = city;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Upadte Data")),
      body: Column(
        children: [
          TextField(
            controller: t1,
          ),
          TextField(
            controller: t2,
          ),
          TextField(
            controller: t3,
          ),
          ElevatedButton(
              onPressed: () {
                String sql =
                    "update student set name ='${t1.text}',contact='${t2.text}',city='${t3.text}' where id = ${widget.id}";
                widget.database.rawUpdate(sql);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return second_page(widget.database);
                  },
                ));
              },
              child: Text("update")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return second_page(widget.database);
                  },
                ));
              },
              child: Text("View Data")),
        ],
      ),
    );
  }
}
