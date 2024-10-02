import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebBrowser extends StatelessWidget {
  WebBrowser({super.key, required this.initialUrl});

  String initialUrl;
  WebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    RxBool loading = true.obs;
    webViewController = WebViewController();
    webViewController?.setJavaScriptMode(JavaScriptMode.unrestricted);
    webViewController?.setBackgroundColor(const Color(0x00000000));
    webViewController?.setNavigationDelegate(
        NavigationDelegate(onPageStarted: (_) => loading.value = false));

    webViewController?.loadRequest(Uri.parse(initialUrl));

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Obx(() {
            return Stack(
              children: [
                WebViewWidget(
                  controller: webViewController!,
                ),
                if (loading.isTrue)
                  const Center(child: CircularProgressIndicator()),
                Positioned(
                  top: 5,
                  left: 10,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff3F51B5),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
