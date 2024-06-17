import 'package:flutter/material.dart';

import 'package:whatsapp_new_design/features/archived_screen.dart';
import 'package:whatsapp_new_design/features/chats_screen.dart';
import 'package:whatsapp_new_design/contacts_screen.dart';
import 'package:whatsapp_new_design/features/settings_screen.dart';
class HomeScreen extends StatelessWidget {
  final List images=[
    "assets/images/1.jpeg",
    "assets/images/2.jpeg",
    "assets/images/3.jpeg",
    "assets/images/4.jpeg",
    "assets/images/5.jpeg",
    "assets/images/6.jpeg",
  ];
  final List names=[
    "person 1",
    "person 2",
    "person 3",
    "person 4",
    "person 5",
    "person 6",
  ];
  final List msgTiming=[
    "Yesterday",
    "12:20",
    "12/04/24",
    "05:23",
    "Yesterday",
    "Yesterday"
  ];
  final List msgs=[
    "hello",
    "hello",
    "hello",
    "hello",
    "hello",
    "hello",
  ];
  final List msgRead=[
    true,
    true,
    false,
    true,
    true,
    false,
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
        children: [
          // custom app bar
          Padding(padding: EdgeInsets.only(top: 40, left: 15, bottom: 15),
          child: Row(
            children: [
              Text("WhatsApp",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1DA75E),
                    ),
                  ),
                  Spacer(),
                  Padding(padding: EdgeInsets.only(right: 15),
                  child: Icon(Icons.camera_alt_outlined, size: 28),
                  ),
                  PopupMenuButton(
                    onSelected: (selected) {
                      if (selected==6) {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context)=>SettingsScreen(),
                        ));
                      }
                    },
                    elevation:10,
                    iconSize: 28,
                    itemBuilder: (context)=> [
                      PopupMenuItem(
                        value: 1,
                        child: Text(
                          "New Group", 
                        style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Text(
                          "New Broadcast", 
                        style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        value: 3,
                        child: Text(
                          "Linked devices", 
                        style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        value: 4,
                        child: Text(
                          "Starred messages", 
                        style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        value: 5,
                        child: Text(
                          "Payments", 
                        style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        value: 6,
                        child: Text(
                          "Settings", 
                        style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //search container
            Container(
              margin: EdgeInsets.only(bottom: 15, left: 10, right: 10),
              decoration: BoxDecoration(
                color: Color(0xFFF6F5F3),
                borderRadius: BorderRadius.circular(50),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15),
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search...", 
                  border: InputBorder.none,
                  ),
              ),
            ),
            //Archived
            Padding(padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Row(
              children: [
                Icon(Icons.archive_outlined,
                size: 30,),
                SizedBox(width: 25),
                
                GestureDetector(
                  onTap:(){ 
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context)=>ArchivedScreen(),
                        ));
                  },
                  child: Text("Archived",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                      ),
                    ),
                ), 
                  Spacer(),
                  Text("39",
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF1DA75E),
                    ),
                  ),
                ],
              ),
              
            ),
            //Chats
            ListView.builder(
              itemCount: images.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(padding: EdgeInsets.symmetric(vertical: 5),
                child: ListTile(
                  onTap: (){ 
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context)=>ChatsScreen(),
                        ));
                      },
                  leading: CircleAvatar(
                    maxRadius: 28,
                    backgroundImage: AssetImage(
                      images[index]
                      ),
                    ),
                    title: Text(names[index],  
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17),
                  ),
                  subtitle: Text(msgs[index],
                  style: TextStyle(
                    color: Color(0xFF636F75),
                  ),
                  ),
                  trailing: msgRead[index]?Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(msgTiming[index],
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF1DA75E),
                      ),
                      ),
                      SizedBox(height: 6),
                      Container(
                        alignment: Alignment.center,
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          color: Color(0xFF1DA75E),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text("5",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.white,
                        ),
                        ),
                      ),
                    ],
                  )
                  :Text(
                    msgTiming[index],
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                  ),
                )
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:  (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context)=>ContactsScreen(),
                        ));
                      },
        backgroundColor: Color(0xFF1DA75E),
        child: Center(child: Image.asset("assets/images/send.jpg"),
        ),
        ),
    );
  }
}