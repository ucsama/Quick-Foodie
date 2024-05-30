import 'package:flutter/material.dart';
import 'package:quick_foodie/widget/widget_support.dart';
class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(

        margin: const EdgeInsets.only(top: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Material(
            elevation: 2.0,
            child: Container(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Center(child: Text("Wallet",
                  style: AppWidget.HeadlineTextFieldStyle(),
                )))),
          const SizedBox(height: 30.0),
          Container(
            padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 10.0),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(color: Color(0xFFF2F2F2)),
            child: Row(children: [
            Image.asset("images/wallet.png",
              height: 60, width: 60,
              fit: BoxFit.cover,),
              const SizedBox(width: 40.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("Your Wallet", style: AppWidget.LightTextFieldStyle(),),
                  const SizedBox(height: 5.0,),
                  Text("Rs:"+"100", style: AppWidget.boldTextFieldStyle(),)
              ],)
            ],),
          ),
          const SizedBox(height: 20.0,),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text("Add Money", style: AppWidget.semiBooldTextFieldStyle(),),
          ),
            const SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(
                    color: const Color(0xFFE9E2E2)),
                  borderRadius: BorderRadius.circular(5)
              ),
           child: Text("Rs:"+"100",
             style: AppWidget.semiBooldTextFieldStyle(),
           ),
            ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color(0xFFE9E2E2)),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Text("Rs:"+"500",
                  style: AppWidget.semiBooldTextFieldStyle(),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color(0xFFE9E2E2)),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Text("Rs:"+"1000",
                  style: AppWidget.semiBooldTextFieldStyle(),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color(0xFFE9E2E2)),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Text("Rs:"+"2000",
                  style: AppWidget.semiBooldTextFieldStyle(),
                ),
              )
            ],),
            const SizedBox(height: 50.0,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color(0xFF008080), borderRadius: BorderRadius.circular(8)
              ),
              child: const Center(child: Text("Add Money",
                style: TextStyle(color: Colors.white,
                    fontSize: 16.0, fontFamily: 'poppins',
                    fontWeight: FontWeight.bold),),),)
      ],),),
    );
  }
}
