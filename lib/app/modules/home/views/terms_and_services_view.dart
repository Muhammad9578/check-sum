import 'package:flutter/material.dart';

class TermsandServices extends StatelessWidget {
  const TermsandServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms & Services'),
        centerTitle: true,
        backgroundColor: const Color(0xff3700B3), // Change the color as needed
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Carplatemart.sg, provides the website information, material, and data with the below Terms and Conditions of Use. By using our website and andriod App in any form and method the user agrees to the Terms. These Terms are subject to change from time to time. Please read these Terms and check back often. Please use the website ONLY if you are agreeable to these Terms or changes.Use of Website \nAs the User of the website, you should inform us if your Vehicle Registration Plate availability has changed, please update us immediately via our Website. We reserve the right to remove, suspend, edit any posting at our discretion without prior notification to the User of the website. The user warrants that information provided by are correct and current. We reserve the right to decline a new registration or to suspend or terminate any account at any time at our sole and absolute discretion. You allow and agree for us to contact you at any time via the contact details you have submitted through our website. By submitting any post or advertisement to our Website, you hereby grant us a perpetual, worldwide, non-exclusive, sub-licensable, royalty-free license to use, reproduce, display, perform, adapt, modify, sell, distribute and promote such content in any form, in all media now known or hereinafter created and for any purpose, subject to our Privacy Policy. You represent and warrant that you have sufficient rights to grant us this license. We also reserve the right to remove any content submitted by you from our Website at our sole and absolute discretion. The right to review materials posted, to edit, reject to post, to delete any content, stop your access to the Website at our sole discretion without notice. Your Obligations to Use. If you are not the owner of the vehicle registration number, you shall not post without the consent of the owner. The user shall not extraction of the material (“the Content”) from our Website, or use it to create or include it within another website. Create a false post for the purpose of misleading others.',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
