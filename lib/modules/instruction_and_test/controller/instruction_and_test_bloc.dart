import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../_utils/constants/enums.dart';
//import '../repo/instruction_and_test_repo.dart';

part 'instruction_and_test_event.dart';
part 'instruction_and_test_state.dart';

class InstructionAndTestBloc
    extends Bloc<InstructionAndTestEvent, InstructionAndTestState> {
  InstructionAndTestBloc() : super(InstructionAndTestState()) {
    on<ReadInstructions>((event, emit) {
      emit(
        state.copyWith(
          readInstructions: !state.readInstructions,
        ),
      );
    });

    on<StartTest>((event, emit) async {
      emit(
        state.copyWith(
          proceedToStartTest: true,
        ),
      );
    });

    on<UpdateSelectedQuestionIndex>((event, emit) async {
      emit(
        state.copyWith(
          selectedQuestionIndex: event.direction == DIRECTION.backward
              ? event.currentIndex - 1
              : event.currentIndex + 1,
        ),
      );
    });
  }
}
