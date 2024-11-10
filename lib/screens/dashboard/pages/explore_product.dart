import 'package:ecommerce_app_clone/app_utils/ui_helper.dart';
import 'package:ecommerce_app_clone/data/models/product_data_model.dart';
import 'package:ecommerce_app_clone/main.dart';
import 'package:ecommerce_app_clone/screens/dashboard/pages/view_cart/cart/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ExploreProduct extends StatefulWidget{
  ProductModel mProducts;
  ExploreProduct({required this.mProducts});
  @override
  State<ExploreProduct> createState() => _ExploreProductState();
}

class _ExploreProductState extends State<ExploreProduct> {
  List<dynamic> colorList = [
    Colors.indigo,
    Colors.amber,
    Colors.black,
    Colors.purple,

  ];

  List<String> decText =[
    "Such earbuds are portable speakers that fit inside people's ears and connect to any audio-producing device (e.g., a phone or computer) using Bluetooth audio technology. Wired earbuds, by contrast, use a cable to attach to devices that have an input jack.",
  'Specification',
    'Reviews'
  ];


  bool isTap1 = true;
  bool isTap2 = false;
  bool isTap3 = false;
  int index = 0;
  int quantity = 1;
  bool isLoading = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: UiHelper.secondaryColor,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: Center(child: Icon(Icons.arrow_back_ios,color: UiHelper.tertiaryColor,)),
                        ),
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
                  SizedBox(height: 15,),

                  Container(
                      width: 190,
                      height: 250,
                      child: Image.network(widget.mProducts.image!,fit: BoxFit.fill,))




                ],
              ),
            ),
                /*-----Product Details Ui----*/
            Padding(
              padding: const EdgeInsets.only(top: 400),
              child: Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          widget.mProducts.name!,
                          style: mTextStyle25(mFontWeight: FontWeight.bold),
                        ),
                        Text(
                          "\u{20B9}${widget.mProducts.price}",
                          style: mTextStyle22(mFontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 200,),
                          child: Text(
                            "Seller: Tariqul isalm",
                            style: mTextStyle18(mFontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 60,
                              height: 30,
                              decoration: BoxDecoration(
                                color: UiHelper.primaryColor,
                                borderRadius: BorderRadius.circular(11)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                Icon(
                                  Icons.star,
                                  size: 17,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "4.8",
                                  style: mTextStyle12(
                                      mColor: Colors.white,
                                      mFontWeight: FontWeight.bold),
                                ),
                              ],),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "(320 Review)",
                              style: mTextStyle14(mColor: Colors.black54,mFontWeight: FontWeight.bold  ),
                            )
                          ],
                        ),
                        SizedBox(height: 15,),
                        SizedBox(
                          height: 50,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: colorList.length,
                              itemBuilder: (_,index){
                                return Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: CircleAvatar(
                                    radius: 18,
                                    backgroundColor: UiHelper.quaternaryColor.withOpacity(0.3),
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: colorList[index],
                                    ),
                                  ),
                                );
                              }),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  isTap1 = true;
                                  isTap2 = false;
                                  isTap3 = false;
                                  index = 0;
                                  setState(() {});
                                },
                                child: Container(
                                    padding: EdgeInsets.all(10),
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: isTap1
                                          ? UiHelper.primaryColor
                                          : Colors.transparent,
                                      borderRadius:
                                      BorderRadius.circular(
                                          20),
                                    ),
                                    child: Center(
                                        child: Text(
                                            "Description",style: isTap1 ? mTextStyle14(mColor: Colors.white,mFontWeight: FontWeight.bold) :mTextStyle14(mFontWeight: FontWeight.bold))))),
                            InkWell(
                                onTap: () {
                                  isTap2 = true;
                                  isTap1 = false;
                                  isTap3 = false;
                                  index = 1;
                                  setState(() {});
                                },
                                child: Container(
                                    padding: EdgeInsets.all(10),
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: isTap2
                                            ? UiHelper.primaryColor
                                            : Colors
                                            .transparent,
                                        borderRadius:
                                        BorderRadius
                                            .circular(20)),
                                    child: Center(
                                        child: Text(
                                            "Specifications",style: isTap2 ? mTextStyle14(mColor: Colors.white,mFontWeight: FontWeight.bold) :mTextStyle14(mFontWeight: FontWeight.bold) ,)))),
                            InkWell(
                                onTap: () {
                                  isTap3 = true;
                                  isTap1 = false;
                                  isTap2 = false;
                                  index = 2;
                                  setState(() {});
                                },
                                child: Container(
                                    padding: EdgeInsets.all(10),
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: isTap3
                                            ? UiHelper.primaryColor
                                            : Colors
                                            .transparent,
                                        borderRadius:
                                        BorderRadius
                                            .circular(20)),
                                    child: Center(
                                        child:
                                        Text("Reviews",style: isTap3 ? mTextStyle14(mColor: Colors.white,mFontWeight: FontWeight.bold) :mTextStyle14(mFontWeight: FontWeight.bold))))),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          decText[index],
                          style: mTextStyle14(mColor: Colors.black54,mFontWeight: FontWeight.bold),textAlign: TextAlign.left,
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.only(left: 16,right: 16,top: 785),
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xff202020),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 120,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            InkWell(
                                onTap: (){
                                  if(quantity>1){
                                    quantity--;
                                    setState(() {

                                    });
                                  }
                                },
                                child: Image.asset('assets/icons/remove.png',width: 20,height: 20,fit: BoxFit.fill,)),

                            Text("${quantity}",
                                style: mTextStyle16(mColor: Colors.white)),
                            InkWell(
                                onTap: (){
                                  quantity++;
                                  setState(() {

                                  });
                                },
                                child: Image.asset('assets/icons/add.png',width: 20,height: 20,fit: BoxFit.fill,)),

                          ],
                        ),
                      ),
                      BlocListener<CartBloc, CartState>(
                       listener: (context, state) {
                         if(state is CartLoadingState){
                           isLoading = true;
                           setState(() {

                           });
                         }else if(state is CartErrorState){
                           isLoading = false;
                           setState(() {

                           });
                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMsg)));
                         }else if(state is CartLoadedState){
                            isLoading = false;
                            setState(() {

                            });
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Added to Cart....')));

                         }
                         },
                          child: SizedBox(
                          width: 200,
                          height: 50,
                          child:  ElevatedButton(onPressed: (){

                            context.read<CartBloc>().add(AddToCartEvent(
                                productId: int.parse(widget.mProducts.id!),
                                quantity: quantity));


                          }, child: isLoading?CircularProgressIndicator(color: Colors.white,):Text('Add to Cart',style: mTextStyle16(mColor: Colors.white,),),style: ElevatedButton.styleFrom(backgroundColor: UiHelper.primaryColor),)),
)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}