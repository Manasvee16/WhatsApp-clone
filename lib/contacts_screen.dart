// ignore_for_file: unused_element, unused_local_variable, override_on_non_overriding_member, unused_label

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_new_design/contact_bloc.dart';
import 'package:whatsapp_new_design/contacts_repository.dart';
import 'package:whatsapp_new_design/features/settings_screen.dart';
import 'package:whatsapp_new_design/new_contact.dart';
import 'package:whatsapp_new_design/widget/user_model.dart';

class ContactsScreen extends StatefulWidget {
  ContactsScreen({super.key});
  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List<List<UserModel>> contacts = [];
 final ContactBloc contactBloc=ContactBloc(ContactsRepository(firestore: FirebaseFirestore.instance));
  @override
  void initState() {
    contactBloc.add(ContactInitialEvent());
    super.initState();
  }

// void getContacts()async{
// contacts=await ContactsRepository(firestore: FirebaseFirestore.instance).getAllContacts();
// print("contacts fetched ${contacts}");
//
//flow:
@override
  Widget build(BuildContext context) {
return BlocProvider(
  create: (context) => contactBloc,
  child: Scaffold(
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
                          ]),
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
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Text(
                        "Contacts",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ),
                    PopupMenuItem(
                      value: 3,
                      child: Text(
                        "Refresh",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ),
                    PopupMenuItem(
                      value: 4,
                      child: Text(
                        "Help",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          body:  SizedBox(
            width: 3000,
            height: 18000,
            child: SingleChildScrollView(
            //       shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
            //                       itemCount: state.contacts.length,
            //                       itemBuilder: (context, index) {
            //                         //final contact=contactRepository.saveNewContact(event.contact);
            //                         final contact = state.contacts[index];
            //                         return ListTile(
            //                           title: Text(contact["displayName"]),
            //                           subtitle: Text(contact["phones"][0]["number"]),
            //                         );
            //                       },
            //   child: 
              child: Column(children: [
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
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                        // CircleAvatar(
                        //   maxRadius: 25,
                        //   backgroundImage: AssetImage(
                        //     "assets/images/1.jpeg", // Replace with the path to your profile picture
                        //   ),
                        // ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "+91 95211 98431 (You)",
                              style: TextStyle(fontSize: 16, color: Colors.black54),
                            ),
                            BlocConsumer<ContactBloc, ContactState>(
                    bloc: contactBloc,
                    //builder: (context, state) {
                      // return BlocConsumer<ContactBloc, ContactState>(
                      //   bloc: contactBloc,
              // listenWhen: (previous, current) => current is ContactActionState,
              // buildWhen: (previous, current) => current is !ContactActionState,
                  builder: (context, state) {
                        if (state is LoadingContactState) {
                      //print('loading');
                      return Center(
                      child: CircularProgressIndicator(),);
                    } else if (state is SuccessContactState) {
                      // Show success message or navigate to contact list
                      //print('Contact added successfully');
                      return  SizedBox(
                          width: 200,
                          height: 700,
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: AlwaysScrollableScrollPhysics(),
                                    itemCount: state.contacts.length,
                                    itemBuilder: (context, index) {
                                      //final contact=contactRepository.saveNewContact(event.contact);
                                      final contact = state.contacts[index];
                                      return ListTile(
                                        title: Text(contact["displayName"]),
                                        subtitle: Text(contact["phones"][0]["number"]),
                                      );
                                    },
                                  ),
                          );
                    } else if (state is FailureContactState) {
                      //print('error');
                      return Scaffold(
                        body: Center(
                        child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => NewContact(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "Failed to add contact",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                      )
                      );
                    }
                    else{
                      return Container();
                    }
                    },
                    listener: (context, state) {
                    if (state is NewContactNavigateToScreenActionState) {
                      Navigator.pop(context);
                    }
                    else if (state is ContactSavedActionState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Contact Saved')));
                }})],
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
                      )
                      )
              ])
                      )
                      ]),
            ),
          )));
                  }
}