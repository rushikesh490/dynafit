import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'assessment_state.dart';

class AssessmentCubit extends Cubit<AssessmentState> {
  AssessmentCubit() : super(AssessmentInitial());

  void changePage(int count){
    emit(AssessmentPageChange(count: count));
  }

}
