// ignore_for_file: unused_element, unused_local_variable

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contacts/contact.dart';

part 'contact_events.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final ContactRepository contactRepository;

  ContactBloc(this.contactRepository) : super(InitialContactState()) {
    on<AddContact>((event, emit) async {
      try {
        emit(LoadingContactState());
        final contact=await contactRepository.addContact(event.contact);
        emit(SuccessContactState());
        final CollectionReference myItems =FirebaseFirestore.instance.collection("contacts");
        myItems.add(myItems).then((DocumentReference doc) =>
    print('DocumentSnapshot added with ID: ${doc.id}'));
      } catch (error) {
        emit(FailureContactState(error.toString()));
      }
    });
    @override
Stream<ContactState> mapEventToState(ContactEvent event) async* {
  if (event is AddContact) {
    yield LoadingContactState();
    try {
      await contactRepository.addContact(event.contact);
      yield SuccessContactState();
    } catch (error) {
      yield FailureContactState(error.toString());
    }
  }
  // Handle other events (if any)
}
  }
}

class ContactRepository {
  final List<Contact> _contacts = [];

  Future<void> addContact(Contact contact) async {
    _contacts.add(contact);
  }
}
