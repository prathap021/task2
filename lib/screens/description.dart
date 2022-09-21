import 'package:flutter/material.dart';
import 'package:sample/services/descriptionapi.dart';

class Desc extends StatefulWidget {
  const Desc({Key? key}) : super(key: key);

  @override
  State<Desc> createState() => _DescState();
}

class _DescState extends State<Desc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getAll(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    title: Text(snapshot.data[index].title),
                    subtitle: Text(snapshot.data[index].price.toString()),
                  ),
                );
              });
        },
      ),
    );
  }
}
