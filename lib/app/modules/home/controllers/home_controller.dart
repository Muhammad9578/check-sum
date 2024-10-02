import 'dart:convert';
import 'dart:developer';
import 'dart:math' as math;

import 'package:check_sum_flutter/app/modules/home/controllers/chat_gpt.dart';
import 'package:check_sum_flutter/app/modules/home/controllers/json_storage.dart';
import 'package:check_sum_flutter/app/utils/constants/constants.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class HomeController extends GetxController {
  TextEditingController checkSumPlateController = TextEditingController();
  PackageInfo? packageInfo;
  RxList numerologyList = [].obs;

  @override
  Future<void> onReady() async {
    // TODO: implement onReady
    super.onReady();
    packageInfo = await PackageInfo.fromPlatform();
    readJson();
  }

  RxString checkSumResult = ''.obs;
  RxBool checkSumErrorVisible = false.obs;
  RxString checkSumErrorMessage = ''.obs;

  //zodiac car no
  TextEditingController ageController = TextEditingController();
  TextEditingController zodiacluckyCarNumberController =
      TextEditingController(text: 'Aries');
  TextEditingController genderController = TextEditingController(text: 'Male');
  RxString zodiacluckyCarNumberResult = ''.obs;
  RxBool zodiacluckyCarNumberErrorVisible = false.obs;
  RxString zodiacluckyCarNumberErrorMessage = ''.obs;

//lucky car no
  TextEditingController nameController = TextEditingController();
  TextEditingController luckyCarNumberController = TextEditingController();
  RxString luckyCarNumberResult = ''.obs;
  RxString luckyCarNumberDescription = ''.obs;
  RxString zodiacluckyCarNumberDescription = ''.obs;
  RxBool luckyCarNumberErrorVisible = false.obs;
  RxString luckyCarNumberErrorMessage = ''.obs;
  RxString luckyNumberGroupValue = 'byDob'.obs;

//zodiac

  Future<void> getzodiacCarLuckyNumber() async {
    try {
      zodiacluckyCarNumberResult.value = '';
      zodiacluckyCarNumberDescription.value = '';
      List jsonData = await JsonStorage.readJson(true);
      FocusManager.instance.primaryFocus!.unfocus();
      hidezodiacluckyCarNumberError();

      if (ageController.text.isEmpty) {
        EasyLoading.showToast("Please enter your age");
        return;
      }
      String input = zodiacluckyCarNumberController.text.trim().toUpperCase();
      if (input.isEmpty) return;
      EasyLoading.show(status: 'loading...');
      for (var data in jsonData) {
        if (data!['zodiac'] == input &&
            data['gender'] == genderController.text &&
            data['dob'] == ageController.text) {
          Future.delayed(const Duration(seconds: 2), () {
          zodiacluckyCarNumberDescription.value= data['description'];
            EasyLoading.dismiss();
            zodiacluckyCarNumberResult.value = data['result'];
          });

          return;
        }
      }

      String prompt = "";

      prompt =
          "Suggest a lucky car plate no for this zodiac sign $input , gender ${genderController.text} and date of birth ${ageController.text}";

      final response = await OpenAI.instance.completion.create(
        model: "gpt-3.5-turbo-instruct",
        prompt:
            "$prompt with 4 digits from 1 to 9999 like 1234 and make sure no aplphabet and charcater involve in response and reponse must not exceed 4 digits please, Using Pythagorean numerology where luck number is same for Zodiac Sign, gender and date of birth everytime",
        n: 1,
      );

      log(response.choices.toString());
      String text = response.choices[0].text.replaceAll(RegExp(r'[^\w\s]|\n'),
          ''); // Remove special characters and newline characters

      math.Random random = math.Random();
      String newText = text.length > 4 ? text.substring(0, 4) : text;

      // newText = "12E3";

      for (int i = 0; i < newText.length; i++) {
        if (!isDigit(newText[i])) {
          int randomNumber = random.nextInt(10);
          newText = newText.replaceRange(i, i + 1, randomNumber.toString());
        }
        if (newText.startsWith('0')) {
        newText = newText.replaceFirst('0', (random.nextInt(9) + 1).toString());
       }
      }
      // await getZodiacSignDescription(newText);

      zodiacluckyCarNumberDescription.value= await generateDescription("Write Description for $newText");
      jsonData.add({
        'zodiac': input,
        'gender': genderController.text,
        'dob': ageController.text,
        'result': newText,
        'description': zodiacluckyCarNumberDescription.value
      });

      JsonStorage.saveJson(jsonData, true);

      EasyLoading.dismiss();

      zodiacluckyCarNumberResult.value = newText;
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showToast(e.toString(),
          duration: const Duration(seconds: 10));
    }
  }

  //

  Future<void> getCarLuckyNumber() async {
    try {
      List jsonData = await JsonStorage.readJson(false);
      luckyCarNumberResult.value = '';
      FocusManager.instance.primaryFocus!.unfocus();
      hideluckyCarNumberError();
      luckyCarNumberDescription.value = '';
      String input = luckyCarNumberController.text.trim().toUpperCase();
      String name = nameController.text.trim();
      if (input.isEmpty) return;
      if (name.isEmpty) {
        EasyLoading.showToast('Please Enter Name');
        return;
      }

      if (luckyNumberGroupValue.value == 'byDob') {
        if (!RegExp(r'^([0-2][0-9]|3[0-1])/(0[1-9]|1[0-2])/(19|20)\d{2}$')
            .hasMatch(input)) {
          showluckyCarNumberError("Invalid Input");
          return;
        }
      }

      EasyLoading.show(status: 'loading...');
      for (var data in jsonData) {
        if (data['name'] == name.trim() && data['dob'] == input) {
          Future.delayed(const Duration(seconds: 2), () {

            luckyCarNumberDescription.value= data['description'];
            EasyLoading.dismiss();
            luckyCarNumberResult.value = data['result'];
          });

          return;
        }
      }

      String prompt = "";
      // if (luckyNumberGroupValue.value == 'byDob') {
      prompt =
          "Suggest a lucky car plate no for this date of birth $input and name=$name";
      // } else {
      //   prompt = "Suggest a lucky car plate no for this name $input";
      // }
      final response = await OpenAI.instance.completion.create(
        model: "gpt-3.5-turbo-instruct",
        // prompt: "Choose a lucky number for my car plate number only from 0001 to 9999, output can be single digit to four digit without alphabet based only on pythagoras theorem strictly using numbers only without any alphabet Below are my input . 1) my date of birth - 10 Aug 1981 2) my name - Ralph Koh 3) tell me why this number is suitable for me",
        prompt:
            "$prompt with 4 digits from 1 to 9999 like 1234 and make sure no alphabet and charcater involve in response and reponse must not exceed 4 digits please, Using Pythagorean numerology where luck number is same for DOB and name everytime",
        n: 1,
      );

      log(response.choices.toString());
      String text = response.choices[0].text.replaceAll(RegExp(r'[^\w\s]|\n'),
          ''); // Remove special characters and newline characters
      math.Random random = math.Random();
      String newText = text.length > 4 ? text.substring(0, 4) : text;
      log("==================Response======================");
      log(newText.toString());
      log("==================Response======================");
      // newText = "12E3";

      for (int i = 0; i < newText.length; i++) {
        if (!isDigit(newText[i])) {
          int randomNumber = random.nextInt(9)+1;
          newText = newText.replaceRange(i, i + 1, randomNumber.toString());
        }
        if (newText.startsWith('0')) {
        newText = newText.replaceFirst('0', (random.nextInt(9) + 1).toString());
       }
      }
     luckyCarNumberDescription.value= await generateDescription("Write Description for $newText");
      jsonData.add({
        'name': name,
        'dob': input,
        'result': newText,
        'description': luckyCarNumberDescription.value
      });
      JsonStorage.saveJson(jsonData, false);

      EasyLoading.dismiss();
      luckyCarNumberResult.value = newText;
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showToast(e.toString(),
          duration: const Duration(seconds: 10));
    }
  }

  bool isDigit(String char) {
    return int.tryParse(char) != null;
  }

  void calculatCheckSumNumber() {
    FocusManager.instance.primaryFocus!.unfocus();
    hideCheckSumError();
    String input = checkSumPlateController.text.trim().toUpperCase();
    if (input.isEmpty) {
      showCheckSumError("Invalid Input");
      return;
    }
    if (input.length > 7) {
      showCheckSumError("Input length must not be greater than 7 characters");
      return;
    }
    if (!RegExp(r'^[A-Z]{1,3}[0-9]{1,4}$').hasMatch(input)) {
      showCheckSumError("Invalid Input");
      return;
    }
    String? letters = RegExp(r'[A-Z]{1,3}').firstMatch(input)!.group(0);
    if (letters!.length == 1) {
      letters = "0$letters";
    } else if (letters.length == 3) letters = letters.substring(1);
    List<int> letterValue = [
      letters.codeUnitAt(0) == 48 ? 0 : letters.codeUnitAt(0) - 64,
      letters.codeUnitAt(1) - 64
    ];
    String? numbers = RegExp(r'[0-9]{1,4}').firstMatch(input)!.group(0);
    numbers = numbers!.padLeft(4, '0');
    List<int> numberValue = numbers.runes
        .map((rune) => int.parse(String.fromCharCode(rune)))
        .toList();
    List<int> sixDigit = [...letterValue, ...numberValue];
    final List<int> fixedNumbers = [9, 4, 5, 4, 3, 2];
    List<int> combineArray =
        List.generate(sixDigit.length, (i) => sixDigit[i] * fixedNumbers[i]);
    int remainder =
        combineArray.reduce((value, element) => value + element) % 19;
    String output = '$input${AppConstants.checkLetters[remainder]}';
    checkSumResult.value = output;
  }

  void resetCheckSum() {
    checkSumPlateController.text = '';
    checkSumResult.value = '';
    checkSumErrorVisible.value = false;
    checkSumErrorMessage.value = '';
  }

  void resetLuckyPhoneNumber() {
    luckyCarNumberController.text = '';
    luckyCarNumberResult.value = '';
    luckyCarNumberErrorVisible.value = false;
    luckyCarNumberErrorMessage.value = '';
    nameController.clear();
  }

  void zodiacResetLuckyPhoneNumber() {
    // zodiacluckyCarNumberController.text = '';
    zodiacluckyCarNumberResult.value = '';
    ageController.clear();
    zodiacluckyCarNumberErrorVisible.value = false;
    zodiacluckyCarNumberErrorMessage.value = '';
  }

  void showCheckSumError(String error) {
    checkSumErrorVisible.value = true;
    checkSumErrorMessage.value = error;
  }

  void hideCheckSumError() {
    checkSumErrorVisible.value = false;
    checkSumErrorMessage.value = '';
  }

  void showluckyCarNumberError(String error) {
    luckyCarNumberErrorVisible.value = true;
    luckyCarNumberErrorMessage.value = error;
  }

  void showzodiacluckyCarNumberError(String error) {
    zodiacluckyCarNumberErrorVisible.value = true;
    zodiacluckyCarNumberErrorMessage.value = error;
  }

  void hideluckyCarNumberError() {
    luckyCarNumberErrorVisible.value = false;
    luckyCarNumberErrorMessage.value = '';
  }

  void hidezodiacluckyCarNumberError() {
    zodiacluckyCarNumberErrorVisible.value = false;
    zodiacluckyCarNumberErrorMessage.value = '';
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/numerology_list.json');
    final data = await json.decode(response);
    numerologyList.value = data;
  }

  // getDescription(String luckyNumber) async {
  //   String prompt = "";
  //   prompt =
  //       "Write details for this lucky number, why are these numbers can be lucky in detail like 200 to 300 words";
  //   final response = await OpenAI.instance.completion.create(
  //     model: "gpt-3.5-turbo-instruct",
  //     prompt: prompt,
  //     n: 1,
  //   );
  //   log(response.choices.toString());
  //   String text = response.choices[0].text;
  //   luckyCarNumberDescription.value = text;
  //   // log(numerologyList.value.length.toString());
  //   // if (luckyNumber.startsWith('0')) {
  //   //   luckyNumber = luckyNumber.substring(1);
  //   // }
  //   // for (var number in numerologyList) {
  //   //   if (number['name'].toString() == luckyNumber.toString()) {
  //   //     luckyCarNumberDescription.value = number['notes'];
  //   //   }
  //   // }
  // }
  // getZodiacSignDescription(String luckyNumber) async {
  //   String prompt = "";
  //   prompt =
  //       "Write details for this lucky number, why are these numbers can be lucky in detail like 200 to 300 words with combination of astrologic facts";
  //   final response = await OpenAI.instance.completion.create(
  //     model: "gpt-3.5-turbo-instruct",
  //     prompt: prompt,
  //     n: 1,
  //   );
  //   log(response.choices.toString());
  //   String text = response.choices[0].text;
  //   zodiacluckyCarNumberDescription.value = text;
  //   //Previous through jsonFile
  //   // if (luckyNumber.startsWith('0')) {
  //   //   luckyNumber = luckyNumber.substring(1); // Removes the leading zero
  //   // }
  //   // for (var number in numerologyList) {
  //   //   if (number['name'].toString() == luckyNumber.toString()) {
  //   //     // log(number['notes'].toString());
  //   //     zodiacluckyCarNumberDescription.value = number['notes'];
  //   //   }
  //   // }
  // }



  generateDescription(String text) async {
    Map message = {
      'role': 'user',
      'content': text,
    };

    List messages = [
       {
      "role": "system",
      
      "content": "\nInstructions:"
          "\nYou are Luck Number Generater. if i ask for lucky number then generate only 4 digit lucky number ranging 1000 to 9999 on the bases of DOB, Gender, zodiav sign etc according to prompt"
          " If i ask for lucky number descrition then generate description for liucky number of about 200 to 300 words"
          '\n',
     
    },
      message,
    ];
    log("messages${messages.toString()}");
    final response = await ChatGPT.sendMessage(messages);
      print("response${response.toString()}");
      final firstCompletionChoice = response.choices.first.message.content;

      return firstCompletionChoice;
  }
}
