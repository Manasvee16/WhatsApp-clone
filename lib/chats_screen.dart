import 'package:flutter/material.dart';
import 'package:whatsapp_new_design/settings_screen.dart';
import 'package:whatsapp_new_design/widgets/chat_sample.dart';
class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});
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
          leadingWidth: 20,
          title: Padding(
            padding: EdgeInsets.only(top: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset("assets/images/1.jpeg",
                  height: 45,
                  width: 45,
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Person1",
                    style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 3),
                    Text("online",
                    style: TextStyle(fontSize: 15, color: Colors. black54),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        actions: [
          Padding(padding: EdgeInsets.only(top: 10, right: 25),
          child: Icon(
            Icons.videocam_outlined,
            size: 35,
            ),
        ),
        Padding(padding: EdgeInsets.only(top: 10, right: 20),
          child: Icon(
            Icons.call_outlined,
            size: 28,
            ),
        ),
        PopupMenuButton(
                    onSelected: (selected) {
                      if (selected==8) {
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
                          "View contact", 
                        style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Text(
                          "Media, links, and docs", 
                        style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        value: 3,
                        child: Text(
                          "Search", 
                        style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        value: 4,
                        child: Text(
                          "Mute notifications", 
                        style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        value: 5,
                        child: Text(
                          "Disappearing messages", 
                        style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        value: 6,
                        child: Text(
                          "Wallpaper", 
                        style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
        // Padding(padding: EdgeInsets.only(top: 10, right: 10),
        //   child: Icon(
        //     Icons.more_vert,
        //     size: 28,
        //     ),
        // ),
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/background.png"
              ),
            fit: BoxFit.cover,
            ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 100),
          child: Column(
            children: [
              Container(
                width: 300,
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xFFFFF3C2),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 8,
                    ),
                  ],
                ),
                child: Text("Messages and calls are end-to-end encrypted, No one outside of this chat can read or listen. Tap to learn more",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              ),
              //Messages here
              ChatSamples(),
              // ChatSamples(),
              // ChatSamples(),
              // ChatSamples(),
              // ChatSamples(),
              // ChatSamples(),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 65,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          // color: Colors.black,
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover
          )
        ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.emoji_emotions_outlined,
                      color: Colors.black38,
                      size: 30,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            hintText: "Message",
                            border: InputBorder.none
                          )
                        ),
                      ),
                      Icon(Icons.attachment_outlined,
                  color: Colors.black38,),
                  SizedBox(width:15),
                  Icon(Icons.camera_alt_outlined,
                  color: Colors.black38,
                  size: 28,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: Color(0xFF1DA75E),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(Icons.mic,
                size: 30,
                color: Colors.white,
                )
                ),
            ],
          ),
        ),
      );
  }
}