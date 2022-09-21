import 'package:detabase1/update_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_common/sqlite_api.dart';

class second_page extends StatefulWidget {
  Database database;

  second_page(this.database,);


  @override
  State<second_page> createState() => _second_pageState();
}

class _second_pageState extends State<second_page> {
  List<Map> list = [];
  List name = [];
  List contact = [];
  List city = [];
  List id =[];


  Future view_fun() async {
    String str = "select * form student";
    list = await widget.database.rawQuery(str);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("View Data")),
      body: FutureBuilder(
        future: view_fun(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<Map>? l =[];
            l =snapshot.data as List<Map>?;
            l!.forEach((element) {
              name.add(element['name']);
              contact.add(element['contact']);
              city.add(element['city']);
              id.add(element['id']);
            });
            return ListView.builder(
              itemCount: name.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onLongPress: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context, builder: (context) {
                      return AlertDialog(
                        title: Text('Edit you Data'),
                        actions: [
                          TextButton(onPressed: () {
                            String sql="delete form student where id=${id[index]}";
                            widget.database.rawDelete(sql);
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return second_page(widget.database);
                            },));
                          }, child: Text("Delete")),
                          TextButton(onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return update_page(widget.database,id[index]);
                            },));
                          }, child: Text("Update")),
                        ],
                      );
                    },);
                  },
                  title: Text(name[index]),
                    subtitle: Text(contact[index]),
                );

              },);
          } else {
            return CircularProgressIndicator();
          }
        },),
    );
  }
}
