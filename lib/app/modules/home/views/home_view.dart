import 'package:check_sum_flutter/app/modules/home/views/check_sum_tab.dart';
import 'package:check_sum_flutter/app/modules/home/views/lucky_plate_number_tab.dart';
import 'package:check_sum_flutter/app/modules/home/views/zodiac_sign_tab.dart';
import 'package:check_sum_flutter/app/utils/widgets/drawer.dart';
import 'package:check_sum_flutter/app/utils/widgets/web_browser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CarPlateMart'),
        centerTitle: true,
        backgroundColor: const Color(0xff3700B3),
      ),
      drawer: MyDrawer(),
      body: DefaultTabController(
        length: 3, // Number of tabs
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 0.0),
                ),
              ),
              child: TabBar(
                indicatorColor: const Color(0xff3700B3),
                unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0xff3700B3),
                ),
                tabs: [
                  Tab(
                    height: Get.height * .08,
                    child: const Text(
                      'CheckSum',
                    ),
                  ),
                  Tab(
                    height: Get.height * .08,
                    child: const Text(
                      'Lucky Plate Number ',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Tab(
                    height: Get.height * .08,
                    child: const Text(
                      'Zodiac Sign',
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  CheckSumTab(controller: controller),
                  LuckyPlateNumberTab(controller: controller),
                  ZodiacPlateNumberTab(controller: controller),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: Get.height * .03),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => Get.to(() => WebBrowser(
                  initialUrl:
                      'https://carplatemart.sg/post-free-advertisement/')),
              child: SizedBox(
                  width: Get.width * .2,
                  child: Image.asset("assets/sellplate.png")),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () => Get.to(() =>
                  WebBrowser(initialUrl: 'https://carplatemart.sg/shop/')),
              child: SizedBox(
                  width: Get.width * .2,
                  child: Image.asset("assets/buy_plate.png")),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () => Get.to(() =>
                  WebBrowser(initialUrl: 'https://carplatemart.sg/check-sum/')),
              child: SizedBox(
                  width: Get.width * .2, child: Image.asset("assets/sum.png")),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () => Get.to(() =>
                  WebBrowser(initialUrl: 'https://wagonmate.com/sell-car/')),
              child: SizedBox(
                  width: Get.width * .2,
                  child: Image.asset("assets/sellcar.png")),
            )
          ],
        ),
      ),
    
    
    );
  }
}