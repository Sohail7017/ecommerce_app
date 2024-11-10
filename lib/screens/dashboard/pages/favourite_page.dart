import 'package:flutter/material.dart';

import '../../../app_utils/ui_helper.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UiHelper.quaternaryColor,
        centerTitle: true,
        title: Text('Favourite',style: mTextStyle25(mColor: Colors.white),),
      ),
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text('Favourite Page',style: mTextStyle28(),))

            ],)),

    );
  }
}
