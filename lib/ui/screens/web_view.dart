import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  String url;
  WebViewPage({super.key, required this.url});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}
class _WebViewPageState extends State<WebViewPage> {
  final _controller = WebViewController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      body: WebViewWidget(controller: _controller),
    );
  }
}
