// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ExamTestDTO {
  final String instruction;
  final String testId;
  final String questionId;
  final String questionTitle;
  final String optionId;
  final String optionTitle;
  final String optionImage;
  final bool isCorrectAnswer;
  ExamTestDTO({
    required this.instruction,
    required this.testId,
    required this.questionId,
    required this.questionTitle,
    required this.optionId,
    required this.optionTitle,
    required this.optionImage,
    required this.isCorrectAnswer,
  });

  ExamTestDTO copyWith({
    String? instruction,
    String? testId,
    String? questionId,
    String? questionTitle,
    String? optionId,
    String? optionTitle,
    String? optionImage,
    bool? isCorrectAnswer,
  }) {
    return ExamTestDTO(
      instruction: instruction ?? this.instruction,
      testId: testId ?? this.testId,
      questionId: questionId ?? this.questionId,
      questionTitle: questionTitle ?? this.questionTitle,
      optionId: optionId ?? this.optionId,
      optionTitle: optionTitle ?? this.optionTitle,
      optionImage: optionImage ?? this.optionImage,
      isCorrectAnswer: isCorrectAnswer ?? this.isCorrectAnswer,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'instruction': instruction,
      'testId': testId,
      'questionId': questionId,
      'questionTitle': questionTitle,
      'optionId': optionId,
      'optionTitle': optionTitle,
      'optionImage': optionImage,
      'isCorrectAnswer': isCorrectAnswer,
    };
  }

  factory ExamTestDTO.fromMap(Map<String, dynamic> map) {
    return ExamTestDTO(
      instruction: map['instruction'] as String,
      testId: map['testId'] as String,
      questionId: map['questionId'] as String,
      questionTitle: map['questionTitle'] as String,
      optionId: map['optionId'] as String,
      optionTitle: map['optionTitle'] as String,
      optionImage: map['optionImage'] as String,
      isCorrectAnswer: map['isCorrectAnswer'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExamTestDTO.fromJson(Map<String, dynamic> json) {
    return ExamTestDTO(
      instruction: json['instruction'] as String,
      testId: json['testId'] as String,
      questionId: json['questionId'] as String,
      questionTitle: json['questionTitle'] as String,
      optionId: json['optionId'] as String,
      optionTitle: json['optionTitle'] as String,
      optionImage: json['optionImage'] as String,
      isCorrectAnswer: json['isCorrectAnswer'] as bool,
    );
  }

  @override
  String toString() {
    return 'ExamTestDTO(instruction: $instruction, testId: $testId, questionId: $questionId, questionTitle: $questionTitle, optionId: $optionId, optionTitle: $optionTitle, optionImage: $optionImage, isCorrectAnswer: $isCorrectAnswer)';
  }
}
