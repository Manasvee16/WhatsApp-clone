import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp_new_design/chats_screen.dart';
import 'package:whatsapp_new_design/contacts_repository.dart';
import 'package:whatsapp_new_design/new_contact.dart';
import 'package:whatsapp_new_design/settings_screen.dart';
import 'package:whatsapp_new_design/widget/user_model.dart';
class ContactsScreen extends StatefulWidget {
  ContactsScreen({super.key});
  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}
class _ContactsScreenState extends State<ContactsScreen> {
    final List images = [
    "assets/images/1.jpeg",
    "assets/images/2.jpeg",
    "assets/images/3.jpeg",
    "assets/images/4.jpeg",
    "assets/images/5.jpeg",
    "assets/images/6.jpeg",
  ];
  final List names = [
    "person 1",
    "person 2",
    "person 3",
    "person 4",
    "person 5",
    "person 6",
  ];
  final List msgs = [

    "hello",
    "hello",
    "hello",
    "hello",
    "hello",
    "hello",
  ];
  List<List<UserModel>>contacts=[];
    @override
  void initState() {
    super.initState(); 
    final CollectionReference myContacts = FirebaseFirestore.instance.collection("contacts");
  final CollectionReference myItems =
      FirebaseFirestore.instance.collection("users");
    ContactsRepository(firestore: FirebaseFirestore.instance).getAllContacts();
    getContacts();
    print("contacts");
  }
void getContacts()async{
contacts=await ContactsRepository(firestore: FirebaseFirestore.instance).getAllContacts();
print("contacts fetched ${contacts}");
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: AppBar(
            elevation: 0,
            leading: Padding(
              padding: EdgeInsets.only(left: 10),
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
            leadingWidth: 10,
            title: Padding(
              padding: EdgeInsets.only(top: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Select contact",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 3),
                        //ref.watch(contactsControllerProvider).when(
              // data: (allContacts) {
              //   return Text(
              //     "${allContacts[0].length} contact${allContacts[0].length == 1 ? '' : 's'}",
              //     style: const TextStyle(fontSize: 12),
              //   );
              // },
              // error: (e, t) {
              //   return const SizedBox();
              // },
              // loading: () {
              //   return const Text(
              //     'counting...',
              //     style: TextStyle(fontSize: 12),
              //   );
              // },
                      ],
                        // Text(
                        //   "627 contacts",
                        //   style: TextStyle(fontSize: 15, color: Colors.black54),
                        // ),
                    ),
                    ),
                ],
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(top: 10, right: 20),
                child: Icon(
                  Icons.search,
                  size: 28,
                ),
              ),
              PopupMenuButton(
                onSelected: (selected) {
                  if (selected == 8) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsScreen(),
                      ),
                    );
                  }
                },
                elevation: 10,
                iconSize: 28,
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 1,
                    child: Text(
                      "Invite a friend",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Text(
                      "Contacts",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ),
                  PopupMenuItem(
                    value: 3,
                    child: Text(
                      "Refresh",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ),
                  PopupMenuItem(
                    value: 4,
                    child: Text(
                      "Help",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: //ref.watch(contactsControllerProvider).when(
        // data: (allContacts) {
        //   return ListView.builder(
        //     itemCount: allContacts[0].length + allContacts[1].length,
        //     itemBuilder: (context, index) {
        //       late UserModel firebaseContacts;
        //       late UserModel phoneContacts;

        //       if (index < allContacts[0].length) {
        //         firebaseContacts = allContacts[0][index];
        //       } else {
        //         phoneContacts = allContacts[1][index - allContacts[0].length];
        //       }
        //       return index < allContacts[0].length
        //           ? Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 if (index == 0)
        Column(children: [
                  SizedBox(
                      //height: 500,
                      child: Column(children: [
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Color(0xFF1DA75E),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(
                            Icons.group_add,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: SizedBox(
                            height: 30,
                            //width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "New group",
                                  style: TextStyle(fontSize: 20),
                                ),
                                SizedBox(height: 3),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Color(0xFF1DA75E),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(
                            Icons.person_add,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NewContact(),
                                    ),
                                  );
                                  },
                                child: Text(
                                  "New contact",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              SizedBox(height: 3),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Color(0xFF1DA75E),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(
                            Icons.groups_outlined,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "New community",
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(height: 3),
                            ],
                          ),
                        ),
                        
                      ],
                    ),
                    // Divider between New group/New contact and Contact List
                    //Divider(thickness: 1),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Row(
                        children: [
                          Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                //child: Text(
                                 // 'Contacts on WhatsApp',
                                 // style: TextStyle(
                                  //  fontWeight: FontWeight.w600,
                                 //   color: Colors.grey,
                               //   ),
                              //  ),
                              ),
                          CircleAvatar(
                            maxRadius: 25,
                            backgroundImage: AssetImage(
                              "assets/images/1.jpeg", // Replace with the path to your profile picture
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "+91 95211 98431 (You)",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black54),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
//Divider(thickness: 1),
                    Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: SizedBox(
                          //height: 500,
                          width: MediaQuery.of(context).size.width,
                        ))
                  ])),
                  ListView.builder(
                      //itemCount: images.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:contacts.length,
                      itemBuilder: (context, index) {
                          final List<UserModel>Contacts =contacts[index];
                             // return Text('hello');
                          return Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ChatsScreen(),
                                      //arguments: firebaseContacts,  
                                    ),
                                  );
                                },
                                //contactSource: firebaseContacts,
                                child: Row(children: [
                                 // if (index == allContacts[0].length)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            child: Text(
                              'Invite to WhatsApp',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                                  CircleAvatar(
                                    maxRadius: 28,
                                    backgroundImage: AssetImage(
                                      images[index],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          names[index],
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17,
                                          ),
                                        ),
                                        Text(
                                          msgs[index],
                                          style: TextStyle(
                                            color: Color(0xFF636F75),
                                          ),
                                        ),
                                        ListTile(
                                    title: Text(names[index],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        )),
                                    subtitle: Text(
                                      msgs[index],
                                    ))
                                      ],
                                    
                                    ),
                                  ),
                                ]),
                              )
                              // padding: const EdgeInsets.all(8.0),
                              // child: Material(
                              //   elevation: 5,
                              //   borderRadius: BorderRadius.circular(20),
                              //   child: Padding(
                              //     padding: const EdgeInsets.all(8.0),
                        
        );
          }
          )
          ]
    ));
  }
}