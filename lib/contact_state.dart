part of 'contact_bloc.dart';
@immutable
abstract class ContactState {}
abstract class ContactActionState extends ContactState{}

class InitialContactState extends ContactState {}

class LoadingContactState extends ContactState {}

class SuccessContactState extends ContactState {
  final List<Map<String, dynamic>> contacts;
  SuccessContactState({
    required this.contacts,
});
}

class FailureContactState extends ContactState {
  final String error;

  FailureContactState(this.error);
}
class NewContactNavigateToScreenActionState extends ContactActionState{}
class ContactSavedActionState extends ContactActionState{}