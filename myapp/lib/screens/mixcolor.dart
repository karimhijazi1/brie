import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/screens/read.dart';

class user extends StatefulWidget {
  @override
  State<user> createState() => _userState();
}

class _userState extends State<user> {
  String type = "1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.green, Colors.blue, Colors.red])),
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Welcom mixcolor"),
              ListTile(
                title: const Text(
                  'Admin',
                  style: TextStyle(color: Colors.black),
                ),
                leading: Radio(
                  value: 2,
                  groupValue: type,
                  onChanged: (value) async {
                    setState(() async {
                      type = value.toString();
                      final usercollection =
                          FirebaseFirestore.instance.collection("users");
                      final docRef = usercollection.doc("2ywyjgCO70kkTvONOlgQ");

                      await docRef.update({"usertype": "Admin"});
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Read_component(),
                          ));
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text(
                  'user',
                  style: TextStyle(color: Colors.black),
                ),
                leading: Radio(
                  value: 3,
                  groupValue: type,
                  onChanged: (value) {
                    setState(() async {
                      type = value.toString();
                      final usercollection =
                          FirebaseFirestore.instance.collection("users");
                      final docRef = usercollection.doc("2ywyjgCO70kkTvONOlgQ");

                      await docRef.update({"usertype": "user"});
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Read_component(),
                          ));
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
