part of 'personal_information_cubit.dart';

sealed class PersonalInformationState extends Equatable {
  const PersonalInformationState();
}

final class PersonalInformationInitial extends PersonalInformationState {
  @override
  List<Object> get props => [];
}
