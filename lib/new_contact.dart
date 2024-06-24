
// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
//import 'package:flutter_contacts/contact.dart';
import 'package:whatsapp_new_design/contact_bloc.dart';
import 'package:whatsapp_new_design/contacts_repository.dart';
import 'package:whatsapp_new_design/widget/user_model.dart';
//part 'contact_events.dart';
//part 'contact_state.dart';
class NewContact extends StatefulWidget {
  const NewContact({super.key});
  @override
  State<NewContact> createState() => _ContactState();
}
class _ContactState extends State<NewContact> {
  final ContactBloc contactBloc=ContactBloc(ContactsRepository(firestore: FirebaseFirestore.instance));
  @override
  void initState() {
    contactBloc.add(ContactInitialEvent());
    super.initState();
  }
  late final UserModel userModel;
  //final ContactBloc contactBloc;
  
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final CollectionReference myItems = FirebaseFirestore.instance.collection("contacts");
  //final ContactBloc contactBloc = ContactBloc({});
  // void addItems(String firstName, String lastName, String number) {
  //   myItems.add({
  //     'firstName': firstName,
  //     'lastName': lastName,
  //     'number': number,
  //   });
  //}
  Future<void> addItems(String firstName, String lastName, String number, BuildContext context) async {
  ContactsRepository contactsRepository=ContactsRepository(firestore: FirebaseFirestore.instance);
  //final contact = await contactRepository.addContact(Contact(displayName: firstName+' '+lastName,phones: [Phone(number)]));
  //   //final contact = Contact(firstName: firstName, lastName: lastName, number: number);
    //BlocProvider.of<ContactBloc>(context).add(AddContactEvent(Contact(displayName: firstName+' '+lastName,phones: [Phone(number)])));
  }

    // myItems.add({

    //   'firstName': firstName,

    //   'lastName': lastName,

    //   'number': number,

  //   }).then((_) {

  //     contactBloc.add(ContactEvent.);

  //   }).catchError((_) {

  //     contactBloc.add(ContactEvent.failure);

  //   });

  // }
  @override
  Widget build(BuildContext context) {
return MultiBlocProvider(
  providers: [
    BlocProvider<ContactBloc>(create: (context) => contactBloc),
  ],
  child: BlocConsumer<ContactBloc, ContactState>(
    bloc: contactBloc,
    // listenWhen: (previous, current) => current is ContactActionState,
    // buildWhen: (previous, current) => current is !ContactActionState,
        listener: (context, state) {
          if (state is NewContactNavigateToScreenActionState) {
            Navigator.pop(context);
          }
          else if (state is ContactSavedActionState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Contact Saved')),
            );
          }
        },
          builder: (context, state) {
              if (state is LoadingContactState) {
            //print('loading');
            return Scaffold(
            body: Center(
            child: CircularProgressIndicator(),));
          } 
          else if (state is FailureContactState) {
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
            ));
          }
          else{
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
                onPressed: () async {
                  String firstName=firstNameController.text;
                  String lastName=lastNameController.text;
                  String number=phoneController.text;
                  //await addItems(firstName, lastName, number, context);
                  // showDialog(context: context, builder: (context){
                  //   return AlertDialog();
                  // });
                  //contactBloc.add(ContactInitialEvent());
                  contactBloc.add(AddContactEvent(Contact(displayName: firstName+''+lastName, phones: [Phone(number)])));
                  final snackBar = SnackBar(
            content: const Text('Contact added'),
           );
           ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  Navigator.pop(context);
                  // contactBloc.add(ContactButtonClickedEvent(
                  //   clickedContact: UserModel,
                  // ));
                },
                child: Container(
                    child: Text("Save"),
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xFFD8FDD2)),
              )
            ])]));
          }
          }
          ),
);
  }
}