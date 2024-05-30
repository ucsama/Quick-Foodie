import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quick_foodie/pages/bottomnav.dart';
import 'package:quick_foodie/pages/forgotpassword.dart';
import 'package:quick_foodie/pages/signup.dart';
import 'package:quick_foodie/widget/widget_support.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LogInState();
}
class _LogInState extends State<Login> {
  String email = "", password = "";

  final _formkey= GlobalKey<FormState>();

  TextEditingController useremailcontroller = new TextEditingController();
  TextEditingController userpasswordcontroller = new TextEditingController();

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const BottomNav()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              "No User Found for that Email",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            )));
      }else if(e.code=='wrong-password'){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              "Wrong Password Provided by User",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            )));
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/2.5,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFff5c30),
                      Color(0xFFe74b1a),
                    ])
              ),
            ),
         Container(
           margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/3),
           height: MediaQuery.of(context).size.height/2,
           width: MediaQuery.of(context).size.width,
           decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))),
           child: const Text(""),
         ),
            Container(
              margin: const EdgeInsets.only(top: 60.0,left: 20.0,right: 20.0),
              child: Column(children: [
                Center(child: Image.asset("images/logo.png",width: MediaQuery.of(context).size.width/1.5,fit: BoxFit.cover,)),
                const SizedBox(height: 50.0,),
                Material(
                  elevation: 5.0,
                    borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/2,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20),
                    ),
                    child: Form(
                      key: _formkey,
                      child: Column(children: [
                        Text("Login",style: AppWidget.HeadlineTextFieldStyle(),
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          controller: useremailcontroller,
                          validator: (value){
                            if(value==null||value.isEmpty){
                              return 'Please enter email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: 'Email',hintStyle:AppWidget.semiBooldTextFieldStyle(),
                              prefixIcon: const Icon(Icons.email_outlined),
                          ),
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          controller: userpasswordcontroller,
                          validator: (value){
                            if(value==null||value.isEmpty){
                              return 'Please enter password';
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',hintStyle:AppWidget.semiBooldTextFieldStyle(),
                            prefixIcon: const Icon(Icons.password_outlined),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> Forgotpassword()));
                          },
                          child: Container(
                            padding: const EdgeInsets.only(top: 20),
                              alignment: Alignment.topRight,
                              child: const Text('Forgot Password'),
                          ),
                        ),
                        const SizedBox(height: 60),
                        GestureDetector(
                          onTap: (){
                            if(_formkey.currentState!.validate()){
                              setState(() {
                                email=useremailcontroller.text;
                                password=userpasswordcontroller.text;
                              });
                            }
                            userLogin();
                          },
                          child: Material(
                            elevation: 5.0,
                            borderRadius:BorderRadius.circular(20),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                              width: 200,
                              decoration:  BoxDecoration(color: const Color(0xffff5722),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              alignment: Alignment.center,

                              child: const Text('Login',
                              style: TextStyle(color: Colors.white,
                              fontSize: 18.0,
                                fontFamily: 'Poppins1',
                                fontWeight: FontWeight.bold
                              ),
                              ),
                            ),
                          ),
                        ),
                      ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 70),
                GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Signup()));
                    },
                    child: Text("Don't have an account? Sign up", style: AppWidget.semiBooldTextFieldStyle(), ))
              ],),
            ),
          ],
        ),
      ),
    );
  }
}
