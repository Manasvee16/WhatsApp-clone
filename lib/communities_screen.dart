import 'package:flutter/material.dart';
import 'package:whatsapp_new_design/settings_screen.dart';
class CommunitiesScreen extends StatelessWidget {
  const CommunitiesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: AppBar(
            backgroundColor: Colors.white,
            title: Text("Communities"),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(Icons.camera_alt_outlined, size: 28),
              ),
              // Padding(
              //   padding: EdgeInsets.only(right: 5),
              //   child: Icon(Icons.search, size: 28),
              // ),
              PopupMenuButton(
                onSelected: (selected) {
                  if (selected == 1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettingsScreen(),
                        ));
                  }
                },
                elevation: 10,
                iconSize: 28,
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 1,
                    child: Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ]
        )
            ]
    )
    )
    ),
    body: SingleChildScrollView(
          //width: 20,
          child: Padding(
            padding: EdgeInsets.only(top: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
            ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset("assets/images/community.jpg",
                  height: 45,
                  width: 45,
                  ),
                ),
                Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "New Community",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
          )
          )
        ]
    )
    )
          ]
    )
    )
    )
    );
  }
}