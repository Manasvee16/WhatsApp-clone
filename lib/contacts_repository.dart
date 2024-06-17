import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:whatsapp_new_design/widget/user_model.dart';
class ContactsRepository {
  final FirebaseFirestore firestore;
  ContactsRepository({required this.firestore});
  // Future<void> addContact(Contact contact) async {
  //   await FirebaseFirestore.instance.collection('contacts').add(contact.toMap());
  // }
  Future<bool> saveNewContact(Contact contact) async{
   try {
      final CollectionReference myItems =FirebaseFirestore.instance.collection("contacts");
     //   await myItems.add(myItems).then((DocumentReference doc) =>
    //print('DocumentSnapshot added with ID:'));
    await myItems.add(contact.toJson());
    return true;
   } catch (e) {
     print(e);
     return false;
   }

  }
  Future<List<List<UserModel>>> getAllContacts() async {
    List<UserModel> firebaseContacts = [];
    //List<UserModel> phoneContacts = [];
    try {
      if (await FlutterContacts.requestPermission()) {
        final userCollection = await firestore.collection('contacts').get();
        final allContactsInThePhone = await FlutterContacts.getContacts(
          withProperties: true,
        );
        bool isContactFound = false;
        for (var contact in allContactsInThePhone) {
          for (var firebaseContactData in userCollection.docs) {
            var firebaseContact = UserModel.fromMap(firebaseContactData.data());
            if (contact.phones[0].number.replaceAll(' ', '') ==
                firebaseContact.phoneNumber) {
              firebaseContacts.add(firebaseContact);
              isContactFound = true;
              break;
            }
          }
          // if (!isContactFound) {
          //   phoneContacts.add(
          //     UserModel(
          //       username: contact.displayName,
          //       uid: '',
          //       profileImageUrl: '',
          //       active: false,
          //       lastSeen: 0,
          //       phoneNumber: contact.phones[0].number.replaceAll(' ', ''),
          //       groupId: [],
          //     ),
          //   );
          // }
          isContactFound = false;
        }
      }
    } catch (e) {
      log(e.toString());
    }
    return [firebaseContacts];
  }
}
