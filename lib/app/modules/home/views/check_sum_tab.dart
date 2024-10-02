import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class CheckSumTab extends StatelessWidget {
  const CheckSumTab({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Image.asset("assets/logo.jpg")),
          const SizedBox(
            height: 60,
          ),
          Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "CheckSum:",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
               
                TextFormField(
                  controller: controller.checkSumPlateController,
                  decoration: InputDecoration(
                    labelText: 'Enter Number Here e.g. SLA1234',
                    border: const OutlineInputBorder(),
                    errorText: controller.checkSumErrorVisible.value
                        ? controller.checkSumErrorMessage.value
                        : null,
                  ),
                ),
                const SizedBox(height: 25),
                 Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Result: ',
                        style: TextStyle(
                          color: Color(0xff3F51B5),
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                      Text(
                        controller.checkSumResult.isEmpty
                            ? "XXXXX"
                            : controller.checkSumResult.value,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: controller.checkSumResult.isEmpty ? 18 : 24,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: controller.resetCheckSum,
                      child: Container(
                        width: 90, // Set width to match parent
                        height: 50.0, // Set desired height
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0), // Adjust margin as needed
                        decoration: BoxDecoration(
                          color:
                              const Color(0xff6200EE), // Set background color
                          borderRadius: BorderRadius.circular(
                              8.0), // Set border radius as needed
                        ),
                        child: const Center(
                          child: Text(
                            'Reset',
                            style: TextStyle(
                              color: Colors.white, // Set text color
                              fontSize: 16.0, // Set font size
                              fontWeight: FontWeight.bold, // Set font weight
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: controller.calculatCheckSumNumber,
                      child: Container(
                        width: 110, // Set width to match parent
                        height: 50.0, // Set desired height
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0), // Adjust margin as needed
                        decoration: BoxDecoration(
                          color:
                              const Color(0xff6200EE), // Set background color
                          borderRadius: BorderRadius.circular(
                              8.0), // Set border radius as needed
                        ),
                        child: const Center(
                          child: Text(
                            'Calculate',
                            style: TextStyle(
                              color: Colors.white, // Set text color
                              fontSize: 16.0, // Set font size
                              fontWeight: FontWeight.bold, // Set font weight
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
