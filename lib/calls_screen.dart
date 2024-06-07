import 'package:flutter/material.dart';
import 'package:whatsapp_new_design/settings_screen.dart';
class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: AppBar(
            backgroundColor: Colors.white,
            title: Text("Calls"),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(Icons.qr_code, size: 28),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(Icons.camera_alt_outlined, size: 28),
              ),
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: Icon(Icons.search, size: 28),
              ),
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
                  PopupMenuItem(
                    value: 2,
                    child: Text(
                      "Clear call log",
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
            Container(
                padding: EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: Color(0xFF1DA75E),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(Icons.attachment_outlined,
                size: 30,
                color: Colors.white,
                )
                ),
                Padding(padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Create call link",
                    style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 3),
                    Text("Share a link for your WhatsApp call",
                    style: TextStyle(fontSize: 15, color: Colors. black54),
                      ),
                    ],
                  ),
                ),
              ]
          )
      )
    )
    );
  }
}
