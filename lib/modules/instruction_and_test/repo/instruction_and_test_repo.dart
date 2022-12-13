import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../_utils/constants/string_constants.dart';
import '../../../_utils/entities/api_response.dart';
import '../model/question_answer_dto.dart';

abstract class InstructionTestRepository {
  Future<APIResponse<List<ExamTestDTO>>> getExamTest();
}

class InstructionTestRepositotyImpl implements InstructionTestRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<APIResponse<List<ExamTestDTO>>> getExamTest() async {
    List<ExamTestDTO> examTestList = [];

    try {
      final results =
          await firestore.collection(DBConst.examTestCollectionName).get();

      for (var snapshot in results.docs) {
        ExamTestDTO newExamTest = ExamTestDTO.fromJson(snapshot.data());

        examTestList.add(newExamTest);
      }
      return right(examTestList);
    } catch (e) {
      return left(Failure(code: 500, response: e.toString()));
    }
  }
}
