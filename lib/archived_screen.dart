import 'package:flutter/material.dart';
import 'package:whatsapp_new_design/chats_screen.dart';
import 'package:whatsapp_new_design/settings_screen.dart';
class ArchivedScreen extends StatelessWidget {
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
            title: Text("Archives"),
            actions: [
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
                      ),
                    ]
        ),
      ),
      body: SingleChildScrollView(
        
        child: Column(
          
        children: [
          Container(
            width: 300,
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.all(8),
            child: Text("These chats stay archived when new messages are received. Tap to change",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          Container(
            child: ListView.builder(
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
                  ),
                  );
                },
            ),
          ),
          Container(
            width: 300,
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.all(8),
            child: Text("Your personal messages are end-to-end encrypted",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
        ],
        )
      )
    );
  }
}


