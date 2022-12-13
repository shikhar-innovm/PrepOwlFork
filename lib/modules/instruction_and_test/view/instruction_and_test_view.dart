import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prepowl/_utils/helpers/global.dart';
//import 'package:get/get.dart';
import '../../../_utils/configs/theme_config.dart';
import '../../../_utils/constants/string_constants.dart';
import '../../../_utils/res/dimen.dart';
import '../controller/instruction_and_test_bloc.dart';
import 'widgets/instructions_view.dart';
import 'widgets/test_view.dart';

class InstructionAndTest extends StatelessWidget {
  const InstructionAndTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InstructionAndTestBloc(),
      child: const InstructionAndTestUI(),
    );
  }
}

class InstructionAndTestUI extends StatelessWidget {
  const InstructionAndTestUI({super.key});

  @override
  Widget build(BuildContext context) {
    // final id = Get.arguments["id"];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppConst.instructions,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: buildTimer(context),
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppTheme.secondaryColor,
      ),
      body: BlocConsumer<InstructionAndTestBloc, InstructionAndTestState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppDimen.size20, vertical: AppDimen.size15),
            child: state.proceedToStartTest
                ? TestView(state: state)
                : InstructionView(state: state),
          );
        },
      ),
    );
  }

  Widget buildTimer(BuildContext context) {
    dynamic hours;
    dynamic minutes;
    dynamic seconds;
    return TweenAnimationBuilder(
      duration: const Duration(hours: 2),
      tween: Tween(begin: const Duration(hours: 2), end: Duration.zero),
      builder: (_, dynamic value, child) {
        hours = value.inHours;
        minutes = value.inMinutes % 60;
        seconds = value.inSeconds % 60;
        return GestureDetector(
          onTap: () {},
          child: Text(
            "${hours.toInt().toString().padLeft(2, '0')}:${minutes.toInt().toString().padLeft(2, '0')}:${seconds.toInt().toString().padLeft(2, '0')}",
            style: const TextStyle(color: Color.fromARGB(255, 249, 249, 254)),
          ),
        );
      },
    );
  }
}
