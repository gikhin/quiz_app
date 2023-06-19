/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final CollectionReference profileCollection = FirebaseFirestore.instance.collection('profile');

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.purple),
        backgroundColor: Colors.white,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: profileCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot appSnapshot =
                snapshot.data!.docs[index];
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.purple.withOpacity(0.1),
                        radius: 50,
                        child: Icon(
                          Icons.person_outlined,
                          size: 70,
                          color: Colors.purple,
                        ),
                      ),
                      SizedBox(height: 20),
                      Card(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        child: ListTile(
                          leading: Icon(
                            Icons.email,
                            color: Colors.purple,
                          ),
                          title: Text(
                            user.email!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        child: ListTile(
                          leading: Icon(
                            Icons.location_on,
                            color: Colors.purple,
                          ),
                          title: Text('Gikhin. M.G'),//Text(appSnapshot['name']),
                          subtitle: IconButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/Update',
                                arguments: {
                                  'name': appSnapshot['name'],
                                },
                              );
                            },
                            icon: Icon(Icons.edit),
                          ),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: ListTile(
                          leading: Icon(
                            Icons.phone,
                            color: Colors.purple,
                          ),
                          title: Text('789456123'),//Text(appSnapshot['mobile'].toString()),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        child: ListTile(
                          leading: Icon(
                            Icons.location_on,
                            color: Colors.purple,
                          ),
                          title: Text('PKD'),//Text(appSnapshot['place']),
                          subtitle: IconButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/Update',
                                arguments: {
                                  'place': appSnapshot['place'],
                                },
                              );
                            },
                            icon: Icon(Icons.edit),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          else{
            return Center(child: Text('No Notifications'));
          }
        },
      ),
    );
  }
}*/

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(appBar: AppBar(iconTheme: IconThemeData(color: Colors.purple),backgroundColor:
    Colors.white,title: Text('Profile',style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold),),
        ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,backgroundColor: Colors.purple.withOpacity(0.1),
              child: Icon(Icons.person_outlined,color: Colors.purple,size: 80,),
            ),
            SizedBox(height: 16.0),
            Text(
              'Name',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 16.0),
            ListTile(
              leading: Icon(Icons.email,color: Colors.purple,),
              title: Text(user.email!,style: TextStyle(fontWeight: FontWeight.bold),)
            ),
            ListTile(
              leading: Icon(Icons.phone,color: Colors.purple,),
              title: Text('Phone',style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            ListTile(
              leading: Icon(Icons.location_on,color: Colors.purple,),
              title: Text('Place',style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}

