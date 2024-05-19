
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_foodie/widget/widget_support.dart';
class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
int a=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50.0, left: 20.0,right: 20),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          GestureDetector(
              onTap:(){
                Navigator.pop(context);

              },
              child: const Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black,

              ),

          ),
          Image.asset("images/salad2.png",width: MediaQuery.of(context).size.width,height:  MediaQuery.of(context).size.height/2.5,fit: BoxFit.fill,),
           const SizedBox(height: 15.0,),

          Row(

            children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Mediterranean",style: AppWidget.semiBooldTextFieldStyle(),
                ),
                Text("Chickpea Salad",style: AppWidget.boldTextFieldStyle(),
                ),
              ],
            ),
            const Spacer(),

            GestureDetector(
              onTap: (){
                if(a!=1){
                  --a;
                }

                setState(() {

                });
              },
              child: Container(

                decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.remove,color:Colors.white),
              ),
            ),
              const SizedBox(width: 21.0,),
              Text(a.toString(),style: AppWidget.semiBooldTextFieldStyle(),
              ),
              const SizedBox(width: 21.0,),
              GestureDetector(
                onTap: (){
                  ++a;
                  setState(() {

                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.add,color:Colors.white),
                ),
              )
          ],
          ),
            const SizedBox(height: 20.0,),
 Text("Explore the refreshing flavors "
     "of the Mediterranean with our "
     "Chickpea Salad! Bursting with vibran"
     "t colors and wholesome ingredients, this "
     "salad features tender chickpeas, crisp cucumbers,"
     " juicy tomatoes, tangy feta cheese, and zesty olives, all tossed in"
     " a light vinaigrette dressing.",maxLines: 4
     ,style: AppWidget.LightTextFieldStyle(),),
          const SizedBox(height: 25.0,),
        Row(children: [
          Text("Delivery Time",style: AppWidget.semiBooldTextFieldStyle(),
          ),
          const SizedBox(width: 25.0,),
          const Icon(Icons.alarm,color: Colors.black54,),
           const SizedBox(width: 5.0,),
          Text("30 min",style:AppWidget.semiBooldTextFieldStyle() )

        ],
        ),
          const Spacer(),

          Padding(
            padding: const EdgeInsets.only(bottom: 45.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("Total Price",style: AppWidget.semiBooldTextFieldStyle(),
                ),
                Text("RS250",style: AppWidget.HeadlineTextFieldStyle(),
                ),
              ],),
              Container(
                padding: const EdgeInsets.all(8),
                decoration:  BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(10.0)),
                child:  Row(children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text("Add to Cart",style: TextStyle(color: Colors.white,
                    fontSize: 16.0,
                      fontFamily: 'Poppins'
                    ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16,right: 8),
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration:  BoxDecoration(
                        color: Colors.grey,
                          borderRadius:BorderRadius.circular(8) ,
                      ),
                      child:  const Icon(Icons.shopping_cart_outlined,color: Colors.white,size:15,)
                    ),
                  ),
              ],
                ),
              )
            ],)
          )
        ],
            
      )

      ),
    );
  }
}
