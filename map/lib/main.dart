import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: map(),
  ));
}

class map extends StatefulWidget {
  const map({Key? key}) : super(key: key);

  @override
  State<map> createState() => _mapState();
}

class _mapState extends State<map> {
  List name=[""];
  List contact=[""];
  List city=[""];


  List<Map> m = [
    {'name': 'vishal', 'contact': '787845122', 'city': 'surat'},
    {'name': 'sunil', 'contact': '8585252563', 'city': 'shelana'},
    {'name': 'jay', 'contact': '8501245', 'city': 'ahemda
    @override
    Widget build(BuildContext context) {
    return Scaffold(
    body: ListView.builder(itemBuilder:(context, index) {

    },),
    );
    }
    }
bad'},
    {'name': 'jenish', 'contact': '8564585', 'city': 'lashkana'},
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    m.forEach((element) {
      name.add(element['name']);
      contact.add(element['contact']);
      city.add(element['city']);
    });
    @override
    Widget build(BuildContext context) {
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          body: ListView.builder(itemBuilder:(context, index) {

          },),
        );
      }
    }

    return Scaffold(
        body: ListView.builder(itemBuilder:(context, index) {

        },),
      );
    }
  }

}

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: ListView.builder(itemBuilder:(context, index) {

    },),
  );
}
}
