import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contacts/contact.dart';

part 'contact_events.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final ContactRepository contactRepository;

  ContactBloc(this.contactRepository) : super(InitialContactState()) {
    on<AddContact>((event, emit) async {
      emit(LoadingContactState());
      try {
        await contactRepository.addContact(event.contact);
        emit(SuccessContactState());
      } catch (error) {
        emit(FailureContactState(error.toString()));
      }
    });
  }
}

class ContactRepository {
  final List<Contact> _contacts = [];

  Future<void> addContact(Contact contact) async {
    _contacts.add(contact);
  }
}
