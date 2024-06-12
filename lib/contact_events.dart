part of 'contact_bloc.dart';
@immutable
abstract class ContactEvent {}

class AddContact extends ContactEvent {
  final Contact contact;

  AddContact(this.contact);
}
