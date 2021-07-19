/*كلاس واجهة المستخدم فيها
* اسم المستخدم
*  مكان الإدخال الاسم
* و زر الموافقة
*
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'homeTaps.dart';

class User extends StatefulWidget {
  @override
  UserState createState() => UserState();
}

class UserState extends State<User> {

  double size25 = 25;
  double size15 = 15;

 static TextEditingController controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,height: double.infinity,
        decoration: BoxDecoration(

            image: DecorationImage(image: AssetImage('Image/explorer.gif'),fit: BoxFit.fitHeight),),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              title(),
              textField(Icons.person, 'أدخل اسمك '),
              // textField(Icons.visibility,'كملة المرور'),
              enterButton(),
            ],
          ),
        ),
      ),
    );
  }

// ///////// Text user //////////
  Widget title() {
    return Text(
      "اسم المستخدم",
      style: TextStyle(fontSize: size25, fontWeight: FontWeight.w900),
    );
  }

//   /////////// Text Field  ///////////////

  Widget textField(icon, text) {
    return Container(
      padding: EdgeInsets.all(20),
      child: TextField(
        keyboardType: TextInputType.name,
        controller: controller,
        decoration: inputDecoration(icon, text),
      ),
    );
  }
//  ///////////// InputDecoration ///////////////////////



  InputDecoration inputDecoration(icon, text) {
    return InputDecoration(
      hintText: text,
      hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(size25)),
      prefixIcon: Icon(icon),
      enabledBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(size15)),
    );
  }

//  //////////////// button /////////////
  Widget enterButton() {
    return Container(
      width: 200,
      height: 50,
      child: ElevatedButton(
          onPressed: () {
            if (controller.text.isNotEmpty) {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context)=> HomeTaps())));
            }
          },
          child: Text(
            'التالي',
            style: TextStyle(
                fontSize: size25,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(size15),
          )),
    );
  }
}
