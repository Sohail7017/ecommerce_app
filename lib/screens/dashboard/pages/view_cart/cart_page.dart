import 'package:ecommerce_app_clone/app_utils/ui_helper.dart';
import 'package:ecommerce_app_clone/constant/app_constant.dart';
import 'package:ecommerce_app_clone/main.dart';
import 'package:ecommerce_app_clone/screens/dashboard/pages/view_cart/cart_view_bloc/cart_view_bloc.dart';
import 'package:ecommerce_app_clone/screens/dashboard/pages/view_cart/delete_cart_bloc/delete_cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget{
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var countController = TextEditingController();

  int qty = 1;
  bool isLight = false;

  @override
  void initState() {
    context.read<CartViewBloc>().add(ShowCartDataEvent());

     super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isLight = Theme.of(context).brightness==Brightness.light;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: isLight?UiHelper.secondaryColor:Colors.black,
          centerTitle: true,
          elevation: 2,
          title: Text('My Cart',style: mTextStyle28(mColor: isLight?Colors.black:Colors.white),),
        ),

      body: SafeArea(child: BlocBuilder<CartViewBloc, CartViewState>(
        builder: (context, state) {
          if(state is CartViewLoadingState){
            return Center(child: CircularProgressIndicator(),);
          }else if(state is CartViewErrorState){
            return Center(child: Text(state.errMsg),);
          }else if(state is CartViewLoadedState){
            return state.viewCartModel.data !=null ? ListView.builder(
                itemCount: state.viewCartModel.data!.length,
                itemBuilder: (_,index){
                  var eachData = state.viewCartModel.data![index];
              return InkWell(
                onTap: (){
                  showModalBottomSheet(context: context, builder: (_){
                    return Container(
                      height: 250,
                      child:  Padding(
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
                                color: isLight?UiHelper.secondaryColor:Colors.white10,
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
                                      mColor: isLight?UiHelper.quaternaryColor:Colors.white,
                                    ),
                                    suffixText: "Apply",
                                    suffixStyle: mTextStyle14(
                                        mFontWeight: FontWeight.bold,
                                        mColor: isLight?UiHelper.primaryColor:Colors.white)),
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
                                  style: mTextStyle16(mColor: isLight?UiHelper.quaternaryColor:Colors.white),
                                ),
                                Text("\$245.00",
                                    style: mTextStyle16(mFontWeight: FontWeight.bold,mColor: isLight?Colors.black:Colors.white)),
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
                                    style: mTextStyle14(mFontWeight: FontWeight.bold,mColor: isLight?Colors.black:Colors.white)),
                                Text("\$245.00",
                                    style: mTextStyle16(mFontWeight: FontWeight.bold,mColor: isLight?Colors.black:Colors.white)),
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
                      )
                    );
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SizedBox(
                    height: 160,
                    child: Card(
                      color: isLight? UiHelper.secondaryColor:Colors.white10,
                      elevation:6,
                      margin: EdgeInsets.only(top: 15),

                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 90,
                                  height: 90,

                                  decoration: BoxDecoration(
                                    color: isLight?UiHelper.secondaryColor:Colors.white12,
                                      borderRadius: BorderRadius.circular(12),
                                       ),
                                  child: Center(child: Image.network(eachData.image!,width: 60,height: 70,fit: BoxFit.fill,)),
                                ),
                              ],
                            ),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ListTile(
                                    title: Text(eachData.name!,style: mTextStyle18(mFontWeight: FontWeight.bold,mColor: isLight?Colors.black:Colors.white),),
                                    trailing: InkWell(
                                        onTap: (){
                                        },
                                        child: Icon(Icons.delete,color: Colors.red,)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                      Text("\u{20B9}${eachData.price!}",style: mTextStyle16(mColor: isLight?Colors.black:Colors.white),),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 22),
                                          child: Container(
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
                                                      onTap: (){
                                                        if(qty>1){
                                                          qty--;
                                                        }
                                                        setState(() {

                                                        });
                                                      },
                                                      child: Image.asset('assets/icons/remove.png',color:  isLight?Colors.black:Colors.white,width: 20,height: 20,fit: BoxFit.fill,)),
                                                  Text("${eachData.quantity}",style: mTextStyle16(mFontWeight: FontWeight.bold,mColor: isLight?Colors.black:Colors.white),),

                                                  InkWell(
                                                      onTap: (){
                                                        qty++;
                                                        setState(() {

                                                        });
                                                      },
                                                      child: Image.asset('assets/icons/add.png',color: isLight?Colors.black:Colors.white,width: 20,height: 20,fit: BoxFit.fill,))
                                                ],
                                              ),
                                            ),
                                          ),
                                        )

                                      ],),
                                  )

                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }): Center(child: Text('Mo Carts Add Yet!!'),);
          }

          return Container();
        },
      ),)
    );
  }

}