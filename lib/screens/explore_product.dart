import 'package:ecommerce_app_clone/app_utility/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

class ExploreProduct extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: UiHelper.secondaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: Center(child: Icon(Icons.arrow_back_ios,color: UiHelper.tertiaryColor,)),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 10,
                        ),
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: Center(child: Icon(Icons.share,color: UiHelper.tertiaryColor,)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: Center(child: Image.asset('assets/icons/like.png',color: Colors.black54,height: 25,width: 25,)),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 400,
                    child: Expanded(
                      child: OnBoardingSlider(
                        pageBackgroundColor: Colors.green,
                        hasFloatingButton: false,
                        background: [
                          Container(),
                          Container(),
                          Container(),
                      
                        ],
                          totalPage: 3,
                          speed: 10,
                          headerBackgroundColor: Colors.white,
                          pageBodies: getSliderImage()),
                    ),
                  )
                ],
              ),
            ),
          ),

        ],
      )
    );
  }
  List<Widget> getSliderImage(){
    List<Widget> listImage = [];
    listImage.add(getImage());
    listImage.add(getImage());
    listImage.add(getImage());
    return listImage;
  }

  Widget getImage({String imgPath = 'assets/images/airbud.png'}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
       
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(child: Image.asset(imgPath,height: 200,)),
          ],
        ),
      ),
    );
  }
}