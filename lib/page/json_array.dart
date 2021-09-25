import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:football_highlight/ob/highlight_ob.dart';
import 'package:football_highlight/page/highlight_detail.dart';
import 'package:football_highlight/widget/highlight_widget.dart';
import 'package:http/http.dart' as http;

class JsonArrayEx extends StatefulWidget {
  const JsonArrayEx({Key? key}) : super(key: key);

  @override
  _JsonArrayExState createState() => _JsonArrayExState();
}

class _JsonArrayExState extends State<JsonArrayEx> {
  Uri url = Uri.parse("https://www.scorebat.com/video-api/v1/");

  List<HighlightOb> highList = [];

  getData() async {
    var response = await http.get(url);

    print(response.body);
    if (response.statusCode == 200) {
      List<dynamic> list = json.decode(response.body);

      list.forEach((element) {
        highList.add(HighlightOb.fromJson(element));
      });

      setState(() {});
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text("Football Highlight"),
      ),
      body: ListView.builder(
          itemCount: highList.length,
          itemBuilder: (context, index) {
            return InkWell(
              child: HighLightWidget(highList[index]),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HighLightDetail(highList[index]);
                }));
              },
            );
          }),
    );
  }
}
