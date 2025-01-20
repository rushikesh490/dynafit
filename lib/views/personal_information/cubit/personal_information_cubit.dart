import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'personal_information_state.dart';

class PersonalInformationCubit extends Cubit<PersonalInformationState> {
  PersonalInformationCubit() : super(PersonalInformationInitial());
}
