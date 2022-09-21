import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: future(),
  ));
}

class future extends StatefulWidget {
  const future({Key? key}) : super(key: key);

  @override
  State<future> createState() => _futureState();
}

class _futureState extends State<future> {
  List l = [
    "One",
    "tow",
    "three",
    "four",
    "five",
  ];

  Future<int> get() async {
    await Future.delayed(Duration(seconds: 5));
    return 10;
  }

  Future<List> getstr() async {
    await Future.delayed(Duration(seconds: 5));
    return l;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: FutureBuilder(
        builder: (context, snapshot) {
          print(snapshot.connectionState);

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List list = snapshot.data as List;
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${list[index]}"),
                );
              },
            );
          }
        },
        future: getstr(),
      ),
    );
  }
}
