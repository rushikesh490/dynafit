part of 'onboarding_cubit.dart';

sealed class OnboardingState extends Equatable {
  const OnboardingState();
}

final class OnboardingInitial extends OnboardingState {
  @override
  List<Object> get props => [];
}

final class OnboardingPageChange extends OnboardingState {
  final int count;

  const OnboardingPageChange({required this.count});
  @override
  List<Object> get props => [count];
}
