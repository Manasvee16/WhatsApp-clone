part of 'contact_bloc.dart';
@immutable
abstract class ContactState {}

class InitialContactState extends ContactState {}

class LoadingContactState extends ContactState {}

class SuccessContactState extends ContactState {}

class FailureContactState extends ContactState {
  final String error;

  FailureContactState(this.error);
}
