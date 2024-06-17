// ignore_for_file: unused_element, unused_local_variable

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:whatsapp_new_design/contacts_repository.dart';
import 'package:whatsapp_new_design/widget/user_model.dart';

part 'contact_events.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final ContactsRepository contactRepository;

  ContactBloc(this.contactRepository) : super(InitialContactState()) {
    on<ContactInitialEvent>(contactInitialEvent);
    on<ContactButtonClickedEvent>(contactButtonClickedEvent);
    on<ContactButtonNavigateEvent>(contactButtonNavigateEvent);
    on<AddContactEvent>((event, emit) async {
      emit(LoadingContactState());
      try {
        final contact=await contactRepository.saveNewContact(event.contact);
        emit(SuccessContactState(contacts: []));
      
      } catch (error) {
        emit(FailureContactState('error'));
      }
    });
    // @override
    // Stream<ContactState> mapEventToState(ContactEvent event) async* {
    //   if (event is AddContact) {
    //     yield LoadingContactState();
    //     try {
    //       await contactRepository.addContact(event.contact);
    //       yield SuccessContactState(contacts: []);
    //     } catch (error) {
    //       yield FailureContactState(error.toString());
    //     }
    //   }
    //   // Handle other events (if any)
    // }
  }
  FutureOr<void> contactInitialEvent(
      ContactInitialEvent event, Emitter<ContactState> emit,) async {
        emit(LoadingContactState());
    // Fetch data from Firestore
    final QuerySnapshot<Map<String, dynamic>> snapshot =await FirebaseFirestore.instance.collection('contacts').get();
    print('manasvee');
    print(snapshot.docs.length);
    List<Map<String, dynamic>> contacts=snapshot.docs.map((e) => e.data()).toList();
    print(contacts);
        emit(SuccessContactState(contacts: contacts));
        //GroceryData.groceryProducts.map((e))=>null
      }
  FutureOr<void> contactButtonClickedEvent(
      ContactButtonClickedEvent event, Emitter<ContactState> emit) {
    print('new contact button clicked');
    final CollectionReference myItems =FirebaseFirestore.instance.collection("contacts");
    myItems.add(event.clickedContact);
    emit(ContactSavedActionState());
  }

  FutureOr<void> contactButtonNavigateEvent(
      ContactButtonNavigateEvent event, Emitter<ContactState> emit) {
    print('save button clicked');
    emit(NewContactNavigateToScreenActionState());
  }
}

// class ContactRepository {
//   final List<Contact> _contacts = [];

//   // Future<void> addContact(Contact contact) async {
//   //   _contacts.add(contact);
//   // }

