import 'package:flutter/material.dart';
import 'package:whatsapp_new_design/settings_screen.dart';
class UpdatesScreen extends StatelessWidget {
  const UpdatesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: AppBar(
            backgroundColor: Colors.white,
            title: Text("Updates"),
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
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Status",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
                          "Status privacy", 
                        style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
              ]),
                // Icon(
                //   Icons.more_vert,
                //   size: 26,
                // ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(1.5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Colors.grey, width: 3),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(
                      "assets/images/1.jpeg",
                      height: 55,
                      width: 55,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My Status",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Today, 12:30",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Recent Updates",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          ),

          //sample data
          for(int i=2;i<4;i++)
                        Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(1.5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                            color: Color(0xFF1DA75E),
                            width: 3,
                          ),),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.asset("assets/images/$i.jpeg",
                            height: 55,
                            width: 50,
                            fit: BoxFit.cover,
                            ),
                          ),
                        ),
                  
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Person1",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text("Today, 1:40",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54
                          ),
                        ),
          SizedBox(height: 20),
          Container(
          alignment: Alignment.centerLeft,
          child: Text("Viewed Updates",
          style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Colors.black.withOpacity(0.6),
          ),
          ),
          ),
                          ],
                        ))

                  ],
                      ),),
          // sample data
          for (int i = 2; i < 4; i++)
            Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(1.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: Colors.grey,
                        width: 3,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                        "assets/images/$i.jpeg",
                        height: 55,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Person2",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Today, 2:40",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
        ]),
      )),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {},
            mini: true,
            backgroundColor: Color(0xFFF1F2F6),
            child: Icon(
              Icons.edit,
              color: Colors.black54,
              size: 28,
            ),
          ),
          SizedBox(height: 20),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Color(0xFF1DA75E),
            child: Icon(
              Icons.camera_alt_rounded,
              color: Colors.white,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
