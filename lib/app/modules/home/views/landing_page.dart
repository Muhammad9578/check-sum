import 'package:check_sum_flutter/app/routes/app_pages.dart';
import 'package:check_sum_flutter/app/utils/widgets/web_browser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            "assets/checksum-bg.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: SizedBox(
              width: Get.width,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Transform.rotate(
                    angle: 40,
                    child: Container(
                      width: Get.width * .5,
                      height: Get.height * 0.1,
                      padding: const EdgeInsets.all(12),
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/logo.jpg",
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width * .5,
                    height: Get.height * 0.1,
                    padding: const EdgeInsets.all(12),
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/logo.jpg",
                    ),
                  ),
                  SizedBox(
                    height: Get.height * .1,
                  ),
                  Transform.rotate(
                    angle: 90,
                    child: Container(
                      width: Get.width * .5,
                      height: Get.height * 0.1,
                      padding: const EdgeInsets.all(12),
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/logo.jpg",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * .1,
                  ),
                  Transform.rotate(
                    angle: 180,
                    child: Container(
                      width: Get.width * .5,
                      height: Get.height * 0.1,
                      padding: const EdgeInsets.all(12),
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/logo.jpg",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * .1,
                  ),
                  Transform.rotate(
                    angle: 360,
                    child: Container(
                      width: Get.width * .4,
                      height: Get.height * 0.1,
                      color: Colors.white,
                      alignment: Alignment.bottomLeft,
                      child: Image.asset(
                        "assets/logo.jpg",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Blurred Container
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.8),
          ),
          // Content
          SafeArea(
            child: SizedBox(
              width: Get.width,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Get.height * .1,
                  ),
                  const Center(
                    child: Text(
                      'CARPLATEMART',
                      style: TextStyle(
                        letterSpacing: 5,
                        color: Colors.white, // Set text color
                        fontSize: 36.0, // Set font size
                        fontWeight: FontWeight.w400, // Set font weight
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    child: Text(
                      'WHERE NUMBER MATTERS',
                      style: TextStyle(
                        color: Colors.white, // Set text color
                        fontSize: 20.0, // Set font size
                        fontWeight: FontWeight.normal, // Set font weight
                      ),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.HOME);
                    },
                    child: Container(
                      width: 150, // Set width to match parent
                      height: 50.0, // Set desired height
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0), // Adjust margin as needed
                      decoration: BoxDecoration(
                        color: const Color(0xff6200EE), // Set background color
                        borderRadius: BorderRadius.circular(
                            12.0), // Set border radius as needed
                      ),
                      child: const Center(
                        child: Text(
                          'Start',
                          style: TextStyle(
                            color: Colors.white, // Set text color
                            fontSize: 22.0, // Set font size
                            fontWeight: FontWeight.w400, // Set font weight
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * .1,
                  ),
                  // Container(
                  //   width: Get.width * 1,
                  //   height: Get.height * 0.1,
                  //   padding: const EdgeInsets.all(12),
                  //   color: Colors.white,
                  //   alignment: Alignment.center,
                  //   child: Image.asset(
                  //     "assets/logo.jpg",
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
      extendBody: true,
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
