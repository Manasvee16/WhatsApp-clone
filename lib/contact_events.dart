part of 'contact_bloc.dart';

@immutable
abstract class ContactEvent {}

class ContactInitialEvent extends ContactEvent {}

class AddContactEvent extends ContactEvent {
  late final Contact contact;

  AddContactEvent(this.contact);
}

class ContactButtonClickedEvent extends ContactEvent {
  final UserModel clickedContact;

  ContactButtonClickedEvent({
    required this.clickedContact,
});
}

class ContactButtonNavigateEvent extends ContactEvent {}

