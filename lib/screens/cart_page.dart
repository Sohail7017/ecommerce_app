import 'package:ecommerce_app_clone/app_utils/ui_helper.dart';
import 'package:ecommerce_app_clone/constant/app_constant.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget{
  var countController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: SafeArea(child: Stack(
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
                    height: 30,
                  ),
                  Row(children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white,

                        child: Center(child: Icon(Icons.arrow_back_ios,size: 18,)),
                      ),
                    ),
                    SizedBox(
                      width: 110,
                    ),
                    Text('My Cart',style: mTextStyle18(mFontWeight: FontWeight.bold),
                    )
                  ],),

                             /*---- Cart UI Data------*/

                  Expanded(
                    child: ListView.builder(
                        itemCount: AppConstant.specialItems.length,
                        itemBuilder: (_,index){
                          var eachItem = AppConstant.specialItems[index];
                          return Container(
                            width: double.infinity,
                            height: 170,
                            child: Card(

                              margin: EdgeInsets.symmetric(vertical: 15,),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          color: UiHelper.quaternaryColor.withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(11)
                                      ),
                                      child: Center(child: Image.asset('${eachItem['itemImage']}',width: 100,height: 80,)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(eachItem['itemName'],style: mTextStyle16(mFontWeight: FontWeight.bold),),
                                             SizedBox(
                                               width: 25,
                                             ),
                                              InkWell(
                                                  onTap: (){},
                                                  child: Icon(Icons.delete,color: UiHelper.primaryColor,)),

                                            ],
                                          ),
                                          Text(eachItem['catName'],style: mTextStyle14(mColor: UiHelper.tertiaryColor),),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(eachItem['price'],style: mTextStyle16(mFontWeight: FontWeight.bold),),
                                              SizedBox(
                                                width: 110,
                                              ),
                                              Container(
                                                width: 80,
                                                height: 32,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(15),
                                                  color:UiHelper.quaternaryColor.withOpacity(0.2),

                                                ),
                                                child: Center(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                                    children: [
                                                      InkWell(
                                                          onTap: (){},
                                                          child: Image.asset('assets/icons/remove.png',color: Colors.black,width: 20,height: 20,fit: BoxFit.fill,)),
                                                      Text("1",style: mTextStyle16(mFontWeight: FontWeight.bold),),

                                                      InkWell(
                                                          onTap: (){},
                                                          child: Image.asset('assets/icons/add.png',color: Colors.black,width: 20,height: 20,fit: BoxFit.fill,))
                                                    ],
                                                  ),
                                                ),
                                              )

                                            ],
                                          ),

                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )

                              /*ListTile(
                                leading: Container(
                                  width: 80,
                                  height: 150,
                                  decoration: BoxDecoration(
                                      color: UiHelper.quaternaryColor.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(11)
                                  ),
                                  child: Center(child: Image.asset('${eachItem['itemImage']}',width: 100,height: 80,)),
                                ),
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(eachItem['itemName'],style: mTextStyle16(mFontWeight: FontWeight.bold),),
                                    InkWell(
                                        onTap: (){},
                                        child: Icon(Icons.delete,color: UiHelper.primaryColor,)),
                                  ],
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(eachItem['catName'],style: mTextStyle14(mColor: UiHelper.tertiaryColor),),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(eachItem['price'],style: mTextStyle16(mFontWeight: FontWeight.bold),),
                                        Container(
                                          width: 80,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color:UiHelper.quaternaryColor.withOpacity(0.2),

                                          ),
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                              children: [
                                                InkWell(
                                                    onTap: (){},
                                                    child: Image.asset('assets/icons/remove.png',color: Colors.black,width: 20,height: 20,fit: BoxFit.fill,)),
                                                Text("1",style: mTextStyle16(mFontWeight: FontWeight.bold),),

                                                InkWell(
                                                    onTap: (){},
                                                    child: Image.asset('assets/icons/add.png',color: Colors.black,width: 20,height: 20,fit: BoxFit.fill,))
                                              ],
                                            ),
                                          ),
                                        )
                                      ],)
                                  ],
                                ),
                              ),*/
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 480),
            child: Container(
              height: 300,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),

                    /// --------------------------- Discount box -----------------------
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: UiHelper.secondaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        controller: countController,
                        decoration: InputDecoration(

                            hintText: "Enter Discount Code",
                            border:  OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintStyle: mTextStyle14(
                              mColor: UiHelper.quaternaryColor,
                            ),
                            suffixText: "Apply",
                            suffixStyle: mTextStyle14(
                                mFontWeight: FontWeight.bold,
                                mColor: UiHelper.primaryColor)),
                      ),
                    ),

                     SizedBox(
                      height: 10,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Subtotal",
                          style: mTextStyle16(mColor: UiHelper.quaternaryColor),
                        ),
                        Text("\$245.00",
                            style: mTextStyle16(mFontWeight: FontWeight.bold)),
                      ],
                    ),
                     SizedBox(
                      height: 8,
                    ),

                    Container(
                      width: 420,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: UiHelper.secondaryColor, width: 1)),
                    ),

                     SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total",
                            style: mTextStyle14(mFontWeight: FontWeight.bold)),
                        Text("\$245.00",
                            style: mTextStyle16(mFontWeight: FontWeight.bold)),
                      ],
                    ),
                     SizedBox(
                      height: 20,
                    ),
                         SizedBox(
                           height: 50,
                           child: ElevatedButton(onPressed: (){}, child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text('Checkout',style: mTextStyle16(mColor: Colors.white,mFontWeight: FontWeight.bold),),
                             ],
                           ),style: ElevatedButton.styleFrom(backgroundColor: UiHelper.primaryColor),),
                         )
                     ],
                ),
              ),
            ),
          )
        ],
      ),)
    );
  }
}