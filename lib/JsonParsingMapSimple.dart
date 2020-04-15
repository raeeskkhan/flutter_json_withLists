import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterjsonmapsimple/model/data.dart';
import 'package:http/http.dart';

class JsonParsingMapSimple extends StatefulWidget {
  @override
  _JsonParsingMapSimpleState createState() => _JsonParsingMapSimpleState();
}

class _JsonParsingMapSimpleState extends State<JsonParsingMapSimple> {
  Future<EmployeeData> data;

  @override
  void initState() {
    super.initState();
    Network network =
        Network(url: "http://dummy.restapiexample.com/api/v1/employees");
    data = network.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JSON PARSING"),
      ),
      body: Center(
        child: Container(
          child: FutureBuilder(
            future: data,
            builder: (context, AsyncSnapshot<EmployeeData> snapshot) {
              var allData;
              if (snapshot.hasData) {
                allData = snapshot.data.dataSet;
                return createListView(allData, context);
                //return Text("${snapshot.data.status}");
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget createListView(List<Data> data, BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, int index) {
            return Column(
              children: <Widget>[
                Divider(
                  height: 5.0,
                ),
                ListTile(
                  title: Text("${data[index].employeeName}"),
                  subtitle: Text("${data[index].employeeSalary}"),
                  leading: CircleAvatar(
                    child: Text("${data[index].employeeAge}"),
                    radius: 23,
                    backgroundColor: Colors.amber,
                  ),
                ),
              ],
            );
          }),
    );
  }
}

class Network {
  final String url;

  Network({@required this.url});

  Future<EmployeeData> loadData() async {
    final response = await get(Uri.encodeFull(url));

    if (response.statusCode == 200) {
      print(response.statusCode);

      return EmployeeData.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to get Data");
    }
  }
}
