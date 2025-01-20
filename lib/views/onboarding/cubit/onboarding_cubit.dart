import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {

  List<Map<String,dynamic>>? infoList;

  OnboardingCubit() : super(OnboardingInitial());

  void changePage(int count){
    emit(OnboardingPageChange(count: count));
  }

  List<Map<String, dynamic>> collectInformation(Map<String, dynamic> data) {
    infoList ??= []; // Initialize the list if it's null

    // Check if an item with the same key exists
    bool itemExists = false;

    for (int i = 0; i < infoList!.length; i++) {
      // Compare keys and values
      if (infoList![i].keys.toSet().containsAll(data.keys) &&
          infoList![i].values.toSet().containsAll(data.values)) {
        itemExists = true; // Exact match found, don't add
        break;
      } else if (infoList![i].keys.toSet().containsAll(data.keys)) {
        // If the keys match but values differ, update the value
        infoList![i] = data;
        itemExists = true;
        break;
      }
    }

    if (!itemExists) {
      // If no exact match or key match was found, add the new data
      infoList!.add(data);
    }
    print(infoList);
    return infoList!;
  }


}
