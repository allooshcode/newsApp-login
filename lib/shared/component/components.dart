import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:newsapp/modules/searchmodules/webviewscreen.dart';
import 'package:webview_flutter/webview_flutter.dart';

Widget ItemofNews(urlimage, title, createdAt, {context, url}) {
  return InkWell(
    onTap: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => WebViewScreen(url)));
    },
    child: Row(
      // mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsetsDirectional.only(start: 8, end: 8, top: 8),
            width: 200,
            height: 200,
            child: urlimage == null
                ? Text('no image')
                : Image.network(
                    urlimage,
                    fit: BoxFit.cover,
                  )),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 20,
              ),
              Text(createdAt)
            ],
          ),
        )
      ],
    ),
  );
}
