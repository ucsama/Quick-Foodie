import 'package:cloud_firestore/cloud_firestore.dart';
 class DatabaseMethods{
   Future addUserDetail(Map<String,dynamic> userInfoMap,String id) async{
     return await FirebaseFirestore.instance
         .collection('users')
         .doc(id)
         .set(userInfoMap);
   }
   Future addFoodItem(Map<String,dynamic> userInfoMap,String name) async{
     return await FirebaseFirestore.instance
         .collection(name)
         .add(userInfoMap);
   }

   Future<Stream<QuerySnapshot>> getFoodItem(String name) async {
     return await FirebaseFirestore.instance.collection(name).snapshots();
   }
   Future addFoodToCart(Map<String,dynamic> userInfoMap,String id) async{
     return await FirebaseFirestore.instance
         .collection('users')
         .doc(id)
         .collection("Cart")
         .add(userInfoMap);
   }

   Future<Stream<QuerySnapshot>> getFoodCart(String id) async {
     return await FirebaseFirestore.instance.collection("users").doc(id).collection("Cart").snapshots();
   }
   Future addFoodToOrder(Map<String,dynamic> userInfoMap,String name) async{
     return await FirebaseFirestore.instance
         .collection("orders")
         .add(userInfoMap);
   }
   Future<void> clearCart(String userId) async {
     var cartItems = await FirebaseFirestore.instance
         .collection('users')
         .doc(userId)
         .collection('Cart')
         .get();

     for (var doc in cartItems.docs) {
       await doc.reference.delete();
     }
   }


 }

