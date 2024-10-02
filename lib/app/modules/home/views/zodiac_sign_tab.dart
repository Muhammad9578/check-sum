import 'package:check_sum_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ZodiacPlateNumberTab extends StatelessWidget {
  const ZodiacPlateNumberTab({
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
                  "Zodiac Sign Car Number:",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                    'Whats your zodiac sign, gender and age? Enter you zodiac sign, gender and age so that we can find lucky car plate number for you.'),
                const SizedBox(
                  height: 20,
                ),

                DropdownButtonFormField<String>(
                  value: controller.zodiacluckyCarNumberController.text,
                  items: [
                    'Aries',
                    'Taurus',
                    'Gemini',
                    'Cancer',
                    'Leo',
                    'Virgo',
                    'Libra',
                    'Scorpio',
                    'Sagittarius',
                    'Capricorn',
                    'Aquarius',
                    'Pisces',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    controller.zodiacluckyCarNumberController.text =
                        newValue ?? "";
                  },
                  decoration: InputDecoration(
                    labelText: 'Enter Zodiac Sign Here',
                    border: const OutlineInputBorder(),
                    errorText: controller.zodiacluckyCarNumberErrorVisible.value
                        ? controller.zodiacluckyCarNumberErrorMessage.value
                        : null,
                  ),
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: controller.genderController.text,
                  items: ['Male', 'Female'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    controller.genderController.text = newValue ?? "";
                  },
                  decoration: const InputDecoration(
                    labelText: 'Enter Gender Here',
                    border: OutlineInputBorder(),
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
                      controller.ageController.text = formattedDate;
                    }
                  },
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller: controller.ageController,
                      decoration: const InputDecoration(
                        labelText: 'Enter age here',
                        border: OutlineInputBorder(),
                        // errorText: controller.luckyCarNumberErrorVisible.value
                        //     ? controller.luckyCarNumberErrorMessage.value
                        //     : null,
                      ),
                    ),
                  ),
                ),
                // TextFormField(
                //   controller: controller.ageController,
                //   keyboardType: TextInputType.number,
                //   validator: (value) {
                //     if (value!.isEmpty) {
                //       return 'Please enter age';
                //     }
                //     int? age = int.tryParse(value);
                //     if (age! < 0 || age > 99) {
                //       return 'Age must be between 0 and 99';
                //     }
                //     return null;
                //   },
                //   decoration: const InputDecoration(
                //     labelText: 'Enter age here',
                //     border: OutlineInputBorder(),

                //     // errorText: controller.luckyCarNumberErrorVisible.value
                //     //     ? controller.luckyCarNumberErrorMessage.value
                //     //     : null,
                //   ),
                // ),

                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: controller.zodiacResetLuckyPhoneNumber,
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
                      onTap: () {
                        String value = controller.ageController.text;
                        if (value.isEmpty) {
                          EasyLoading.showToast('Please enter age');
                          return;
                        }
                        // int? age = int.tryParse(value);
                        // if (age! < 1 || age > 99) {
                        //   EasyLoading.showToast('Age must be between 1 and 99');
                        //   return;
                        // }
                        controller.getzodiacCarLuckyNumber();
                      },
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
                const SizedBox(height: 20),
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
                        controller.zodiacluckyCarNumberResult.isEmpty
                            ? "XXXXX"
                            : controller.zodiacluckyCarNumberResult.value,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize:
                              controller.zodiacluckyCarNumberResult.isEmpty
                                  ? 20
                                  : 24,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Visibility(
                  visible: controller
                      .zodiacluckyCarNumberDescription.value.isNotEmpty,
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
                  visible: controller
                      .zodiacluckyCarNumberDescription.value.isNotEmpty,
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
                            controller.zodiacluckyCarNumberDescription.isEmpty
                                ? "XXXXX"
                                : controller
                                    .zodiacluckyCarNumberDescription.value,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: controller
                                      .zodiacluckyCarNumberDescription.isEmpty
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
