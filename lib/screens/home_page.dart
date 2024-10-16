

import 'package:ecommerce_app_clone/app_utility/ui_helper.dart';
import 'package:ecommerce_app_clone/widget/app_constant.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){},
                        child: CircleAvatar(
                            radius: 25,
                            backgroundColor: UiHelper.secondaryColor,
                            child: Center(child: Icon(Icons.grid_view_rounded,color: Colors.black87,))),
                      ),
                      InkWell(
                        onTap: (){},
                        child: CircleAvatar(
                            radius: 25,
                            backgroundColor: UiHelper.secondaryColor,
                            child: Center(child: Icon(Icons.notifications_none,size: 30,color: Colors.black87,))),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: UiHelper.secondaryColor,
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Icon(
                            Icons.search,
                            color: Colors.black54,
                          ),
                        ),
                        hintText: "Search...",
                        hintStyle: mTextStyle14(
                            mFontWeight: FontWeight.bold,
                            mColor: Colors.black54
                        ),
                        suffixIcon: SizedBox(
                          width: 60,
                          child: Row(
                            children: [
                              Container(
                                width: 2,
                                height: 30,
                                color: Colors.black54,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.0),
                                child: Icon(
                                  Icons.filter_list,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                SizedBox(
                  height: 250,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: AppConstant.saleList.length,
                      itemBuilder: (_,index){
                        var eachData = AppConstant.saleList[index];
                        return Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15,),
                              height: 240,
                              width: 380,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(eachData['imgPath']))
                              ),
                            ),
                            Positioned(
                              top: 40,
                              right: 205,
                              child: SizedBox(
                                height: 200,
                                width: 200,
                                child: Column(

                                  children: [
                                    Text(eachData['title'],style: mTextStyle28(mFontWeight: FontWeight.bold),),
                                    Text(eachData['subTitle'],style: mTextStyle25(mFontWeight: FontWeight.bold),),

                                    RichText(
                                        text: TextSpan(
                                            style:  mTextStyle16(mFontWeight: FontWeight.bold),
                                            children: [
                                              TextSpan(text: eachData['perDis'] ),
                                              TextSpan(text: eachData['percent'],style: mTextStyle25(mFontWeight: FontWeight.bold)),
                                            ]
                                        )),
                                    SizedBox(
                                      height: 8,
                                    ),

                                    Container(
                                      height: 30,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: UiHelper.primaryColor,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(child: Text(eachData['button'],style: mTextStyle12(mFontWeight: FontWeight.bold,mColor: UiHelper.quaternaryColor),)),
                                    )


                                  ],
                                ),
                              ),
                            )

                          ],
                        );
                      }),
                ),

                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: AppConstant.categoryList.length,
                      itemBuilder: (_,index){
                        var eacCat = AppConstant.categoryList[index];
                        return Padding(
                          padding: const EdgeInsets.only(left: 16,right: 15),
                          child: InkWell(
                            onTap: (){},
                            child: Column(
                              children: [
                                CircleAvatar(

                                  backgroundImage: AssetImage(eacCat['catImg']),
                                  radius: 25,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(eacCat['catName'],style: mTextStyle14(mFontWeight: FontWeight.bold,mColor: UiHelper.tertiaryColor),)
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Special For You',style: mTextStyle18(mFontWeight: FontWeight.bold),),
                      Text('See all',style: mTextStyle14(mFontWeight: FontWeight.bold,mColor: Colors.grey),),
                    ],),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                    child: GridView.builder(
                        itemCount: AppConstant.specialItems.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2/2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10
                        ),
                        itemBuilder: (_,index){
                          var specialData  = AppConstant.specialItems[index];
                          return Stack(
                            alignment: AlignmentDirectional.topStart,
                            children: [
                              Container(
                                height: 200,
                                width: 210,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: UiHelper.secondaryColor
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10,),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Center(child: Image.asset(specialData['itemImage'],width: 115,height: 115,fit: BoxFit.fill,)),

                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(specialData['itemName'],style: mTextStyle14(mFontWeight: FontWeight.bold),),
                                      Row(
                                        children: [
                                          Text(specialData['price'],style: mTextStyle16(mFontWeight: FontWeight.bold),),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          CircleAvatar(
                                            radius: 10,
                                            backgroundColor: Colors.grey.shade400,
                                            child: CircleAvatar(
                                              radius: 8,
                                              backgroundColor: Colors.orange,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          CircleAvatar(
                                            radius: 10,
                                            backgroundColor: Colors.grey.shade400,
                                            child: CircleAvatar(
                                              radius: 8,
                                              backgroundColor: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          CircleAvatar(
                                            radius: 10,
                                            backgroundColor: Colors.grey.shade400,
                                            child: CircleAvatar(
                                              radius: 8,
                                              backgroundColor: Colors.indigo,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          CircleAvatar(
                                            radius: 10,
                                            backgroundColor: Colors.grey.shade400,
                                            child: Center(
                                              child: CircleAvatar(
                                                radius: 8,
                                                backgroundColor: Colors.white,
                                                child: Center(child: Text("+1",style: TextStyle(fontSize: 10),)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 138,
                                child: Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(

                                        borderRadius: BorderRadius.only
                                          (topLeft: Radius.circular(7),
                                            bottomLeft:Radius.circular(7),
                                            bottomRight: Radius.circular(7),
                                            topRight: Radius.circular(20)
                                        ),
                                        color: UiHelper.primaryColor
                                    ),
                                    child: Center(child: Image.asset('assets/icons/like.png',height: 25,width: 25,))
                                ),
                              )
                            ],
                          );
                        }),
                  ),
                )

              ],
            ),
          ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,color : Colors.white),
        onPressed: () {
          // Action when pressed
        },
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.black,
        elevation: 10,
        shape: CircleBorder(),
      ),


        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
       color: Colors.white,
        shape:const CircularNotchedRectangle(),
        notchMargin: 10.0,
        child : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children : [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: IconButton(
                icon: Icon(Icons.add_card),
                color: Colors.black26,
                onPressed: (){}, //required
                iconSize: 40,
              ),
            ),
            IconButton(
              icon: Icon(Icons.heart_broken_outlined),
              color: Colors.black26,
              onPressed: (){},
              iconSize: 40,
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart_outlined),
              color: Colors.black26,
              onPressed: (){},
              iconSize: 40,
            ),
            IconButton(
              icon: Icon(Icons.person_2_outlined),
              color: Colors.black26,
              onPressed: (){},
              iconSize: 40,
            ),
          ]
        )

      )
    );
  }
}