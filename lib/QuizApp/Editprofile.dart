import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Update extends StatefulWidget {
  const Update({Key? key}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  final CollectionReference App = FirebaseFirestore.instance.collection('profile');
  TextEditingController name = TextEditingController();
  TextEditingController mobilenum = TextEditingController();
  TextEditingController place = TextEditingController();
  void updateApp (upId){
    final data = {
      'name': name.text,
      'mobile': mobilenum.text,
      'place': place.text,
    };
    App.doc(upId).update(data);
  }
  @override
  Widget build(BuildContext context) {
    final args=ModalRoute.of(context)!.settings.arguments as Map;
    name.text=args['name'];
    mobilenum.text=args['mobile'].toString();
    place.text=args['place'];
    final upId = args['id'];
    return Scaffold(
      appBar: AppBar(title: Text('Update'),),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: name,
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: mobilenum,
              decoration: InputDecoration(
                labelText: "Mobile number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: (){
              updateApp(upId);
              Navigator.pop(context);
            }, child: Text('Update')),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: place,
              decoration: InputDecoration(
                labelText: "place",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
