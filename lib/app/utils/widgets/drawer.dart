import 'package:check_sum_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:check_sum_flutter/app/modules/home/views/copyright_view.dart';
import 'package:check_sum_flutter/app/modules/home/views/terms_and_services_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'web_browser.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Image.asset("assets/logo.jpg")),
          Center(
            child:
                Text("Verison: ${homeController.packageInfo!.version ?? ""}"),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Sell Car Plate'),
            onTap: () {
              Get.to(() => WebBrowser(
                  initialUrl:
                      'https://carplatemart.sg/post-free-advertisement/'));
            },
          ),
          ListTile(
            title: const Text('Buy Car Plate'),
            onTap: () {
              Get.to(() =>
                  WebBrowser(initialUrl: 'https://carplatemart.sg/shop/'));
            },
          ),
          ListTile(
            title: const Text('Advance Check Sum'),
            onTap: () {
              Get.to(() =>
                  WebBrowser(initialUrl: 'https://carplatemart.sg/check-sum/'));
            },
          ),
          ListTile(
            title: const Text('Sell Car'),
            onTap: () {
              Get.to(() =>
                  WebBrowser(initialUrl: 'https://wagonmate.com/sell-car/'));
            },
          ),
          ListTile(
            title: const Text('Contact Us'),
            onTap: () {
              Get.to(() =>
                  WebBrowser(initialUrl: 'https://carplatemart.sg/about-us/'));
            },
          ),
          ListTile(
            title: const Text('Copyright'),
            onTap: () {
              Get.to(const CopyRightView());
            },
          ),
          ListTile(
            title: const Text('Terms & Services'),
            onTap: () {
              Get.to(const TermsandServices());
            },
          ),
        ],
      ),
    );
  }
}
