import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:myapp/screens/read.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String type = "1";

  String username = '';
  @override
  Widget build(BuildContext context) {
    Color getcolor() {
      if (FirebaseAuth.instance.currentUser!.email.toString() ==
          "green@gmail.com") {
        username = "green";
        return Colors.green;
      }
      if (FirebaseAuth.instance.currentUser!.email.toString() ==
          "blue@gmail.com") {
        username = "blue";
        return Colors.blue;
      }
      if (FirebaseAuth.instance.currentUser!.email.toString() ==
          "red@gmail.com") {
        username = "red";
        return Colors.red;
      } else {
        return Colors.white;
      }
    }

    return Scaffold(
      backgroundColor: getcolor(),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("Welcom $username "),
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
    );
  }
}
