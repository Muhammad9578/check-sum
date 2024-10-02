import 'package:flutter/material.dart';

class CopyRightView extends StatelessWidget {
  const CopyRightView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Copyright'),
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
                'Without prior written permission to us. You agree that we own, the Content, articles on the Website and any and all intellectual property rights used. The Content shall not be reproduced. Notification on CopyrightIf you believe that your copyright has been infringed, and such infringement is occurring on this Website, please contact us with the Singapore Copyright Act (Cap. 63). In return, you agree that you shall not take any legal action or exercise any legal remedy you may have against us in respect of any copyright infringement unless you have first given us the Infringement Notice and sufficient opportunity to remove the infringing material, and only if we refuse or fail to remove the infringing material within a reasonable time. Where we remove the infringing material in response to your Infringement Notice, you agree not to exercise and you hereby waive, any right of action against us under any applicable laws which you may have in respect of any infringing material appearing on the Website prior to such removal by us. You acknowledge and agree that we have no control and cannot undertake responsibility or liability in respect of infringing material appearing on third-party sites linked on the Website. Indemnity At our request, you agree to indemnify us fully, defend us, and hold us harmless immediately on demand, its officers, directors, agents, affiliates, licensors, and suppliers, from and against all liabilities, claims, expenses, damages, and losses, including legal fees, arising from (i) your use of the Website; (ii) your breach of these Terms; (iii) and/or your violation of any law or the rights of a third party. IP Addresses When you use the Website, we may collect and store information about your computer, including where available your IP address, operating system and browser type, for system administration. Personal Data Protection Act 2012 (the “Act”)',
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
