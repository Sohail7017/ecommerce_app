import 'package:flutter/material.dart';

import '../app_utils/ui_helper.dart';

class SwitchPage extends StatelessWidget {
  const SwitchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UiHelper.quaternaryColor,
        centerTitle: true,
        title: Text('Switch',style: mTextStyle25(mColor: Colors.white),),
      ),
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text('Switch Page',style: mTextStyle28(),))

            ],)),

    );
  }
}
