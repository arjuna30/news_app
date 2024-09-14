import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:news_app/src/component/app_router.gr.dart';

@RoutePage()
class CustomWebViewPage extends StatelessWidget {
  static final route =
      AutoRoute(page: CustomWebViewRoute.page, path: '/webview');
  const CustomWebViewPage({super.key, required this.uri});

  final Uri uri;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.router.pop(),
          icon: const Icon(Icons.close),
        ),
      ),
      body: _CustomWebViewPageBody(uri: uri),
    );
  }
}

class _CustomWebViewPageBody extends StatefulWidget {
  final Uri uri;
  const _CustomWebViewPageBody({required this.uri});

  @override
  State<_CustomWebViewPageBody> createState() => _CustomWebViewPageBodyState();
}

class _CustomWebViewPageBodyState extends State<_CustomWebViewPageBody> {
  final GlobalKey webViewKey = GlobalKey();
  final urlController = TextEditingController();
  late PullToRefreshController pullToRefreshController;
  double progress = 0;
  String url = '';
  InAppWebViewController? webViewController;
  InAppWebViewSettings settings = InAppWebViewSettings(
    useHybridComposition: true,
    allowsInlineMediaPlayback: true,
    useShouldOverrideUrlLoading: true,
    mediaPlaybackRequiresUserGesture: false,
  );

  @override
  void initState() {
    super.initState();
    pullToRefreshController = PullToRefreshController(
      settings: PullToRefreshSettings(color: Colors.blue),
      onRefresh: () async {
        if (Platform.isAndroid) {
          webViewController?.reload();
        } else if (Platform.isIOS) {
          webViewController?.loadUrl(
              urlRequest: URLRequest(url: await webViewController?.getUrl()));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          InAppWebView(
            key: webViewKey,
            initialSettings: settings,
            initialUrlRequest: URLRequest(url: WebUri.uri(widget.uri)),
            pullToRefreshController: pullToRefreshController,
            onPermissionRequest: (controller, request) async {
              return PermissionResponse(
                action: PermissionResponseAction.GRANT,
                resources: request.resources,
              );
            },
            onWebViewCreated: (controller) {
              webViewController = controller;
              InAppWebViewController.clearAllCache();
            },
            onLoadStart: (controller, url) {
              print('URL-START:${url.toString()}');

              setState(() {
                this.url = url.toString();
                urlController.text = this.url;
              });
            },
            onConsoleMessage: (controller, consoleMessage) {
              print('STATE : ON_CONSOLE_MESSAGE ${consoleMessage.message}');
            },
            shouldOverrideUrlLoading: (controller, navigationAction) async {
              return NavigationActionPolicy.ALLOW;
            },
            onLoadStop: (controller, url) async {
              print('STATE : LOAD_STOP ${url.toString()}');

              pullToRefreshController.endRefreshing();
              setState(() {
                this.url = url.toString();
                urlController.text = this.url;
              });
            },
            onReceivedError: (controller, request, error) {
              print('STATE : ON_RECEIVED_ERROR');
              pullToRefreshController.endRefreshing();
            },
            onProgressChanged: (controller, progress) async {
              final url = await controller.getUrl()
                ..toString();
              print('STATE : ONPROGRESS $url');
              if (progress == 100) {
                pullToRefreshController.endRefreshing();
              }

              setState(() {
                this.progress = progress / 100;
                urlController.text = this.url;
              });
            },
            onUpdateVisitedHistory: (controller, url, androidIsReload) {
              print('STATE : UPDATE_VISITED_HISTORY');
              setState(() {
                this.url = url.toString();
                urlController.text = this.url;
              });
            },
            onReceivedServerTrustAuthRequest: (controller, challenge) async {
              print('STATE : IGNORING_THE_SSL');
              return ServerTrustAuthResponse(
                  action: ServerTrustAuthResponseAction.PROCEED);
            },
            onReceivedHttpError: (controller, sourceRequest, response) {
              print('STATE : LOAD_HTTP_ERROR');
              pullToRefreshController.endRefreshing();
            },
          ),
          progress < 1.0
              ? LinearProgressIndicator(value: progress)
              : Container(),
        ],
      ),
    );
  }
}
