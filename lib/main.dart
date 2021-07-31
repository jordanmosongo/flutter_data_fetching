import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

Future<List> getJson() async {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/posts';
  http.Response response = await http.get(Uri.parse(apiUrl));
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  }
  throw Exception('Failed to load data');
}

void _showOnTapMessage(BuildContext context, String message) {
  var alert = new AlertDialog(
    title: Text('new alert'),
    content: Text(message),
    actions: <Widget>[
      TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Ok'))
    ],
  );
  showDialog(context: context, builder: (context) => alert);
}

void main() async {
  List _data = await getJson();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'fetching data from api',
    home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange.shade400,
          centerTitle: true,
          title: Text(
            'Fetching data',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            onPressed: () => {},
            icon: Icon(Icons.menu),
            iconSize: 23.0,
            color: Colors.white,
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
              iconSize: 23.0,
              color: Colors.white,
            )
          ],
        ),
        body: ListView.builder(
            padding: EdgeInsets.all(10.0),
            itemCount: _data.length,
            itemBuilder: (BuildContext context, index) {
              if (index.isOdd) return Divider();
              return ListTile(
                title: Text(
                  _data[index]['title'],
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(_data[index]['body'],
                    style: TextStyle(color: Colors.black54, fontSize: 15.0)),
                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text(
                    _data[index]['title'][0].toString().toUpperCase(),
                    style: TextStyle(
                        color: Colors.orange.shade400, fontSize: 15.0),
                  ),
                ),
                onTap: () {
                  var alert = new AlertDialog(
                    title: Text('new alert'),
                    content: Text(_data[index]['title']),
                    actions: <Widget>[
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Ok'))
                    ],
                  );
                  showDialog(context: context, builder: (context) => alert);
                },
              );
            })),
  ));
}
