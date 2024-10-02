import 'package:check_sum_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LuckyPlateNumberTab extends StatelessWidget {
  const LuckyPlateNumberTab({
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
          // Container(
          //     padding: const EdgeInsets.all(12),
          //     decoration: const BoxDecoration(
          //       color: Colors.white,
          //     ),
          //     child: Image.asset("assets/logo.jpg")),
          const SizedBox(
            height: 20,
          ),
          Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Lucky Car Number:",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                    'Enter your date of birth (DD/MM/YYYY) to calculate your life path number which could align with a lucky plate number.'),
                const SizedBox(
                  height: 20,
                ),
                // Row(
                //   children: [
                //     Row(
                //       children: [
                //         Radio(
                //           value: "byDob",
                //           groupValue: controller.luckyNumberGroupValue.value,
                //           onChanged: (value) {
                //             controller.hideluckyCarNumberError();
                //             controller.resetLuckyPhoneNumber();
                //             controller.luckyNumberGroupValue.value = value!;
                //           },
                //         ),
                //         const Text("By DOB"),
                //       ],
                //     ),
                //     Row(
                //       children: [
                //         Radio(
                //           value: "byName",
                //           groupValue: controller.luckyNumberGroupValue.value,
                //           onChanged: (value) {
                //             controller.hideluckyCarNumberError();
                //             controller.resetLuckyPhoneNumber();
                //             controller.luckyNumberGroupValue.value = value!;
                //           },
                //         ),
                //         const Text("By Name"),
                //       ],
                //     ),
                //   ],
                // ),

                TextFormField(
                  controller: controller.nameController,
                  decoration: const InputDecoration(
                    labelText: 'Enter Name Here',
                    border: OutlineInputBorder(),
                    // errorText: controller.luckyCarNumberErrorVisible.value
                    //     ? controller.luckyCarNumberErrorMessage.value
                    //     : null,
                  ),
                ),
                const SizedBox(height: 20),

                GestureDetector(
                  onTap: () async {
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                      builder: (BuildContext context, Widget? child) {
                        return Theme(
                          data: ThemeData.light(useMaterial3: false).copyWith(
                            colorScheme: const ColorScheme.light().copyWith(
                              background: Colors.white,
                              primary:
                                  const Color(0xff3F51B5), // Set primary color
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (selectedDate != null) {
                      String formattedDate =
                          "${selectedDate.day.toString().padLeft(2, '0')}/${selectedDate.month.toString().padLeft(2, '0')}/${selectedDate.year}";
                      controller.luckyCarNumberController.text = formattedDate;
                    }
                  },
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller: controller.luckyCarNumberController,
                      decoration: InputDecoration(
                        labelText:
                            controller.luckyNumberGroupValue.value == "byName"
                                ? 'Enter Name Here'
                                : 'Enter DOB Here DD/MM/YYYY',
                        border: const OutlineInputBorder(),
                        errorText: controller.luckyCarNumberErrorVisible.value
                            ? controller.luckyCarNumberErrorMessage.value
                            : null,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: controller.resetLuckyPhoneNumber,
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
                      onTap: controller.getCarLuckyNumber,
                      child: Container(
                        width: 100, // Set width to match parent
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
                            'Proceed',
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
                const SizedBox(
                  height: 20,
                ),
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
                        controller.luckyCarNumberResult.isEmpty
                            ? "XXXXX"
                            : controller.luckyCarNumberResult.value,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize:
                              controller.luckyCarNumberResult.isEmpty ? 20 : 24,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                Visibility(
                  visible:
                      controller.luckyCarNumberDescription.value.isNotEmpty,
                  child: const Text(
                    'Description: ',
                    style: TextStyle(
                      color: Color(0xff3F51B5),
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Visibility(
                  visible:
                      controller.luckyCarNumberDescription.value.isNotEmpty,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            controller.luckyCarNumberDescription.isEmpty
                                ? "XXXXX"
                                : controller.luckyCarNumberDescription.value,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: controller.luckyCarNumberResult.isEmpty
                                  ? 18
                                  : 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
