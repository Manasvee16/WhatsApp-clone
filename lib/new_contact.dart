import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewContact extends StatefulWidget {
  const NewContact({super.key});
  @override
  State<NewContact> createState() => _ContactState();
}

class _ContactState extends State<NewContact> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final CollectionReference myItems =
      FirebaseFirestore.instance.collection("users");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(65),
            child: AppBar(
              elevation: 0,
              leading: Padding(
                padding: EdgeInsets.only(top: 10, left: 5),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                ),
              ),
              backgroundColor: Colors.white,
              title: Text("New contact"),
            )),
        body: Column(
          children: [
          Column(
            children: [
            Row(
              children: [
              Padding(
                padding: EdgeInsets.only(top: 10, left: 5),
                child: InkWell(
                  child: Icon(
                    Icons.person,
                    size: 30,
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: firstNameController,
                  decoration: InputDecoration(labelText: "First name"),
                ),
              ),
            ]),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: lastNameController,
                    decoration: InputDecoration(labelText: "Last name"),
                  ),
                ),
              ],
            ),
            Row(children: [
              Padding(
                padding: EdgeInsets.only(top: 10, left: 5),
                child: InkWell(
                  child: Icon(
                    Icons.call,
                    size: 30,
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: phoneController,
                  decoration: InputDecoration(labelText: "Phone"),
                ),
              ),
            ]),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: Container(
                  child: Text("Save"),
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xFFD8FDD2)),
            )
          ])
        ]));
  }
}
