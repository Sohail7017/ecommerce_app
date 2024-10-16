import 'package:ecommerce_app_clone/app_utility/ui_helper.dart';
import 'package:ecommerce_app_clone/widget/app_constant.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                    backgroundColor: Colors.white,
                    child: Icon(Icons.arrow_back_ios),
                  ),
                    SizedBox(
                      width: 115,
                    ),
                  Center(child: Text('My Cart',style: mTextStyle18(mFontWeight: FontWeight.bold),))
                ],
              ),
              SizedBox(height: 20,),
              Expanded(
                child: ListView.builder(
                    itemCount: AppConstant.specialItems.length,
                    itemBuilder: (_,index){
                      var eachItem = AppConstant.specialItems[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: ListTile(
                      leading: Container(
                        width: 60,
                        height: 110,
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(11)
                        ),
                        child: Center(child: Image.asset('${eachItem['itemImage']}',width: 100,height: 80,)),
                      ),
                      title: Text(eachItem['itemName']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(eachItem['catName']),
                          Row(children: [
                            Text(eachItem['price']),
                            Container(
                              width: 100,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: UiHelper.secondaryColor,
                              ),
                              child: Row(
                                children: [
                                IconButton(onPressed: (){}, icon: Icon(Icons.minimize))
                                ],
                              ),
                            )
                          ],)
                        ],
                      ),
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}