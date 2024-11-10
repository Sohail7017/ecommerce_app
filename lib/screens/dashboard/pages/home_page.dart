

import 'package:ecommerce_app_clone/app_utils/ui_helper.dart';

import 'package:ecommerce_app_clone/constant/app_constant.dart';
import 'package:ecommerce_app_clone/screens/dashboard/bloc/product_bloc.dart';
import 'package:ecommerce_app_clone/screens/dashboard/cat_bloc/category_bloc.dart';
import 'package:ecommerce_app_clone/screens/dashboard/pages/explore_product.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget{

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLight = false;
  @override
  void initState() {
     super.initState();
      context.read<ProductBloc>().add(GetProductEvent());
      context.read<CategoryBloc>().add(GetCategoryEvent());
  }
  @override
  Widget build(BuildContext context) {
    isLight = Theme.of(context).brightness==Brightness.light;
    return Scaffold(
      appBar: AppBar(

        backgroundColor: isLight ? Colors.white: Colors.black,
        leading:  Padding(
          padding: const EdgeInsets.only(left: 12),
          child: InkWell(
            onTap: (){},
            child: CircleAvatar(
                radius: 25,
                backgroundColor: isLight ? UiHelper.secondaryColor: Colors.white10,
                child: Center(child: Icon(Icons.grid_view_rounded,color: isLight?Colors.black87:Colors.white,))),
          ),
        ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: InkWell(
                onTap: (){},
                child: CircleAvatar(
                    radius: 25,
                    backgroundColor: isLight ? UiHelper.secondaryColor: Colors.white10,
                    child: Center(child: Icon(Icons.notifications_none,size: 30,color: isLight?Colors.black87:Colors.white,))),
              ),
            ),

          ],
      ),
      body: Container(
            width: double.infinity,
            height: double.infinity,
            color: isLight?Colors.white:Colors.black,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor:  isLight? UiHelper.secondaryColor : Colors.white12,
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Icon(
                              Icons.search,
                              color: isLight?Colors.black54: Colors.white,
                            ),
                          ),
                          hintText: "Search...",
                          hintStyle: mTextStyle14(
                              mFontWeight: FontWeight.bold,
                              mColor: isLight?Colors.black54: Colors.white
                          ),
                          suffixIcon: SizedBox(
                            width: 60,
                            child: Row(
                              children: [
                                Container(
                                  width: 2,
                                  height: 30,
                                  color: isLight?Colors.black54: Colors.white,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                                  child: Icon(
                                    Icons.filter_list,
                                    color: isLight?Colors.black54: Colors.white,
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
                                        child: Center(child: Text(eachData['button'],style: mTextStyle12(mFontWeight: FontWeight.bold,mColor: Colors.white),)),
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
                  BlocBuilder<CategoryBloc,CategoryState>(builder: (_,state){
                    if(state is CategoryLoadingSate){
                      return Center(child: CircularProgressIndicator(),);
                    }else if(state is CategoryErrorSate){
                      return Center(child: Text(state.errorMsg),);
                    }else if(state is CategoryLoadedSate){
                      return SizedBox(
                        height: 80,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.mCategories.length,
                            itemBuilder: (_,index){
                              var eacCat = state.mCategories[index];
                              return Padding(
                                padding: const EdgeInsets.only(left: 16,right: 15),
                                child: InkWell(
                                  onTap: (){},
                                  child: Column(
                                    children: [
                                      CircleAvatar(

                                      backgroundColor: UiHelper.primaryColor,
                                        child: Text(eacCat.id!),
                                        radius: 25,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(eacCat.name!,style: mTextStyle14(mFontWeight: FontWeight.bold,mColor: isLight?UiHelper.tertiaryColor: Colors.white),)
                                    ],
                                  ),
                                ),
                              );
                            }),
                      );
                    }
                    return Container();
                  }),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Special For You',style: mTextStyle18(mFontWeight: FontWeight.bold,mColor:  isLight? Colors.black:Colors.white),),
                        Text('See all',style: mTextStyle14(mFontWeight: FontWeight.bold,mColor: Colors.grey),),
                      ],),
                  ),
                  BlocBuilder<ProductBloc,ProductState>(builder: (_,state){
                    if(state is ProductLoadingState){
                      return Center(child: CircularProgressIndicator());
                    }else if(state is ProductErrorState){
                      return Center(child: Text("${state.errorMsg}"));
                    }else if (state is ProductLoadedState){
                      print("${state.mProducts.length}");
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                        child: GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: state.mProducts.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 2/2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10
                            ),
                            itemBuilder: (_,index){
                              return InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ExploreProduct(mProducts: state.mProducts[index])));
                                },
                                child: Stack(
                                  alignment: AlignmentDirectional.topStart,
                                  children: [
                                    Container(
                                      height: 200,
                                      width: 210,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: isLight?UiHelper.secondaryColor:Colors.white12
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10,),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 26),
                                              child: Image.network(state.mProducts[index].image!,width: 90,height: 100,fit: BoxFit.fill,),
                                            ),

                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text(state.mProducts[index].name!,style: mTextStyle14(mFontWeight: FontWeight.bold,mColor: isLight? Colors.black:Colors.white),),
                                            SizedBox(height: 5,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text("\u{20B9}${state.mProducts[index].price!}",style: mTextStyle16(mFontWeight: FontWeight.bold,mColor: isLight? Colors.black:Colors.white),),
                                                SizedBox(
                                                  width: 10,
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
                                                  child: Center(
                                                    child: CircleAvatar(
                                                      radius: 8,
                                                      backgroundColor: Colors.white,
                                                      child: Center(child: Text("+1",style: TextStyle(fontSize: 10,color: Colors.black),)),
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
                                ),
                              );
                            }),
                      );
                    }
                    return Container();
                  })


                ],
              ),
            ),
          ),

    );
  }
}