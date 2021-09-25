import 'package:flutter/material.dart';
import 'package:football_highlight/ob/highlight_ob.dart';

class HighLightWidget extends StatelessWidget {
  HighlightOb? highlightOb;
  HighLightWidget(this.highlightOb);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red[900],
      child: Column(
        children: [
          Container(height: 200,
          width: double.infinity,
          child: Image.network(highlightOb!.thumbnail!, fit: BoxFit.cover)),
          SizedBox(height: 10),
          Text(highlightOb!.title!, style: TextStyle(
            fontSize: 18,
            color: Colors.white
          )),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
