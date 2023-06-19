import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled22/QuizApp/Pages.dart';
import 'package:untitled22/QuizApp/Profile.dart';

import 'LoginPage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.purple),backgroundColor:
      Colors.white,title: Text('Home',style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold),),
        actions: [IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
          FirebaseAuth.instance.signOut();
          Fluttertoast.showToast(msg: 'User Successfully Logout');
        }, icon: Icon(Icons.logout))],leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile()));
          }, icon: Icon(Icons.person_outlined))),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30,left: 15),
            child: Text("Let's Play Quiz,",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.purple)),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 15,bottom: 3,left: 15),
            child: Text('Choose Level',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(color: Colors.green,
              child: ListTile(onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuestionWidget()),
                );
              },
                  contentPadding: EdgeInsets.symmetric(vertical: 50, horizontal: 27),
                  title: Center(
                      child: Text('Easy',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),))
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(color: Colors.orange,
              child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QuestionWidget()),
                    );
                  },
                  contentPadding: EdgeInsets.symmetric(vertical: 50, horizontal: 27),
                  title: Center(child: Text('Medium',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),))
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(color: Colors.red,
              child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QuestionWidget()),
                    );
                  },
                  contentPadding: EdgeInsets.symmetric(vertical: 50, horizontal: 27),
                  title: Center(child: Text('Hard',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),))
              ),
            ),
          ),

        ],
      ),
    );
  }
}

