import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:football_highlight/ob/highlight_ob.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HighLightDetail extends StatefulWidget {
  HighlightOb highlightOb;
  HighLightDetail(this.highlightOb);

  @override
  _HighLightDetailState createState() => _HighLightDetailState();
}

class _HighLightDetailState extends State<HighLightDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  print("HEllo"+ widget.highlightOb.url!);
                  _launchURL();
                },
                icon: Icon(Icons.language))
          ],
          title: Text(widget.highlightOb.title!),
          backgroundColor: Colors.red[900],
        ),
        body: ListView(children: [
          Container(
              height: 450,
              child: Html(data: """${widget.highlightOb.embed}""")),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.highlightOb.competition!.name!,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25)),
                SizedBox(height: 10),
                Text(
                    "${widget.highlightOb.side1!.name!}  VS  ${widget.highlightOb.side2!.name!}",
                    style: TextStyle(color: Colors.red[900], fontSize: 18)),
                SizedBox(height: 10),
                Divider(color: Colors.black, thickness: 1.5),
                Text("Video",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25)),
                Container(
                  height: 200,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                          child: Column(
                        children: [
                          Container(
                            height: 150,
                            child: Html(
                                data:
                                    """${widget.highlightOb.videos![index].embed}"""),
                          ),
                          SizedBox(height: 20),
                          Text('${widget.highlightOb.videos![index].title}')
                        ],
                      ));
                    },
                    itemCount: widget.highlightOb.videos!.length,
                  ),
                ),
              ],
            ),
          )
        ]));
  }

  _launchURL() async {
    if (await canLaunch(widget.highlightOb.url!)) {
      await launch(widget.highlightOb.url!);
    } else {
      throw 'Could not launch this url';
    }
  }
}
