import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_foodie/pages/signup.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  TextEditingController mailcontroller= new TextEditingController();

  String email="";

  final _formkey= GlobalKey<FormState>();

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Password Reset Email has been sent !",
            style: TextStyle(fontSize: 18.0),
          )));
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "No user found for that email.",
              style: TextStyle(fontSize: 18.0),
            )));
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Container(child: Column(children: [
        const SizedBox(height: 70.0,),
        Container(
          alignment: Alignment.topCenter,
          child: const Text("Password Recovery",
            style:TextStyle(color: Colors.white,
                fontSize: 30.0,fontWeight: FontWeight.bold),
        ),
        ),
        const SizedBox(height: 10.0,),
        const Text("Enter your email", style: TextStyle(
          color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold
        ),),
        Expanded(child: Form(
            key: _formkey,
            child: Padding(padding: const EdgeInsets.only(left: 10.0),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextFormField(
                controller: mailcontroller,
                validator: (value){
                  if(value==null|| value.isEmpty){
                    return 'please enter email';
                  }
                  return null;
                },
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(fontSize: 18.0, color: Colors.white),
                  prefixIcon: Icon(Icons.person, color: Colors.white, size: 30.0,
                  ),
                    border: InputBorder.none),
                ),
              ),
             SizedBox(height: 40.0,),

                  GestureDetector(
                    onTap: (){
                      if(_formkey.currentState!.validate()){
                        setState(() {
                          email= mailcontroller.text;
                        });
                        resetPassword();
                      }
                    },
                    child: Container(
                      width: 140,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Text(
                          "Send Email",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
            SizedBox(height: 50.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Dont have an account?", style: TextStyle(fontSize: 18.0, color: Colors.white),),
                SizedBox(width: 5.0,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Signup()));
                  },
                  child: Text("Create", style: TextStyle(
                      color: Color.fromARGB(225, 184, 166, 6),
                      fontSize: 20.0, fontWeight: FontWeight.w500
                  ),),
                )
              ],
            )
                ],
              ),
            )


        ),
        ),

        

      ],
      ),
      ),
    );
  }
}
