import 'package:check_sum_flutter/app/routes/app_pages.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  //TODO: add env file
  // OpenAI.apiKey = Env.apiKey;

  OpenAI.apiKey = "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";

  // final response = await OpenAI.instance.completion.create(
  //   model: "gpt-3.5-turbo-instruct",
  //   prompt: "Suggest a car plate no for this date of birth 29/07/2000",
  //   n: 1,
  // );

  // Printing the output to the console.
  // print(response.toString());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CheckSum',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      builder: EasyLoading.init(),
    );
  }
}
