part of 'assessment_cubit.dart';

sealed class AssessmentState extends Equatable {
  const AssessmentState();
}

final class AssessmentInitial extends AssessmentState {
  @override
  List<Object> get props => [];
}

final class AssessmentPageChange extends AssessmentState {
  final int count;

  const AssessmentPageChange({required this.count});
  @override
  List<Object> get props => [count];
}
