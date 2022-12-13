part of 'instruction_and_test_bloc.dart';

class InstructionAndTestState {
  final bool readInstructions;
  final bool proceedToStartTest;
  final int selectedQuestionIndex;
  final String errorMessage;

  InstructionAndTestState({
    this.readInstructions = false,
    this.proceedToStartTest = false,
    this.selectedQuestionIndex = 0,
    this.errorMessage = '',
  });

  InstructionAndTestState copyWith({
    bool? readInstructions,
    bool? proceedToStartTest,
    int? selectedQuestionIndex,
    String? errorMessage,
  }) {
    return InstructionAndTestState(
      readInstructions: readInstructions ?? this.readInstructions,
      proceedToStartTest: proceedToStartTest ?? this.proceedToStartTest,
      selectedQuestionIndex:
          selectedQuestionIndex ?? this.selectedQuestionIndex,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  String toString() =>
      'InstructionAndTestState(readInstructions: $readInstructions, proceedToStartTest: $proceedToStartTest, selectedQuestionIndex: $selectedQuestionIndex,errorMessage:$errorMessage)';
}
