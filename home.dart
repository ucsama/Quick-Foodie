import "package:flutter/material.dart";
import "package:quick_foodie/pages/details.dart";
import "package:quick_foodie/widget/widget_support.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool icecream = false, pizza = false, salad = false, burger = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: const EdgeInsets.only(top: 50.0, left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello,",
                    style: AppWidget.boldTextFieldStyle(),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 30.0,
              ),
              Text(
                "Delicious Food",
                style: AppWidget.HeadlineTextFieldStyle(),
              ),
              Text("Discover and Get Great Foood",
                  style: AppWidget.LightTextFieldStyle()),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                  margin: EdgeInsets.only(right: 20.0),
                  child: showItem()),
              const SizedBox(
                height: 30.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Details()));
                    },
                    child: Container(

                      margin: EdgeInsets.all(5),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "images/salad2.png",
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                "Veggie Taco Hash",
                                style: AppWidget.semiBooldTextFieldStyle(),

                              ), Text(
                                "Fresh & Healthy",
                                style: AppWidget.LightTextFieldStyle(),
                              ),
                              Text("RS250",style: AppWidget.semiBooldTextFieldStyle(),)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15.0,),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "images/salad3.png",
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              "Mix Veg Salad",
                              style: AppWidget.semiBooldTextFieldStyle(),

                            ), Text(
                              "Spicy with Onions",
                              style: AppWidget.LightTextFieldStyle(),
                            ),
                            Text("RS150",style: AppWidget.semiBooldTextFieldStyle(),)
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
              ),
              const SizedBox(height: 30.0,),
              Container(
                margin: EdgeInsets.only(right: 20.0),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Image.asset("images/salad2.png", height: 120,width: 120,fit: BoxFit.cover,),
                      const SizedBox(width: 20.0,),
                      Column(children: [
                        Container(
                            width: MediaQuery.of(context).size.width/2,
                            child: Text("Mediterranean Chickpea Salad",style: AppWidget.semiBooldTextFieldStyle(),)),
                        const SizedBox(height: 5.0,),
                        Container(
                            width: MediaQuery.of(context).size.width/2,
                            child: Text("Honey Goot Cheese",style: AppWidget.LightTextFieldStyle(),)),
                        const SizedBox(height: 5.0,),
                        Container(
                            width: MediaQuery.of(context).size.width/2,
                            child: Text("RS300",style: AppWidget.semiBooldTextFieldStyle(),))
                      ],)
                    ],),
                  ),
                ),
              )
            ],
          ),
        ),
      ),

    );

  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            icecream = true;
            pizza = false;
            salad = false;
            burger = false;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: icecream ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                "images/ice-cream.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: icecream ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream = false;
            pizza = true;
            salad = false;
            burger = false;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: pizza ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                "images/pizza.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: pizza ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream = false;
            pizza = false;
            salad = true;
            burger = false;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: salad ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                "images/salad.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: salad ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream = false;
            pizza = false;
            salad = false;
            burger = true;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: burger ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                "images/burger.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: burger ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
