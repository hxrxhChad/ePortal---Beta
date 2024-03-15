// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_button/group_button.dart';

import '../../backend/state management/index.dart';
import '../widgets/index.dart';

class AddTestView extends StatelessWidget {
  AddTestView({super.key});

  TextEditingController testNameController = TextEditingController();
  TextEditingController testCodeController = TextEditingController();
  TextEditingController testDescriptionController = TextEditingController();
  TextEditingController timeStampHourController = TextEditingController();
  TextEditingController timeStampMinuteController = TextEditingController();
  TextEditingController timeStampSecondController = TextEditingController();
  TextEditingController questionTextController = TextEditingController();
  TextEditingController optionTextController = TextEditingController();
  TextEditingController testEligibilityController = TextEditingController();
  TextEditingController testSyllabusController = TextEditingController();
  TextEditingController answerSheetController = TextEditingController();
  TextEditingController questionIndexController = TextEditingController();
  TextEditingController marksController = TextEditingController();
  TextEditingController negativeMarksController = TextEditingController();
  GroupButtonController isRightController = GroupButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: SingleChildScrollView(
          child: BlocConsumer<TestCubit, TestState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Column(
                children: [
                  const VGap(height: 30),
                  const Text(
                    'Add Test',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const VGap(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TestField(
                              // maxWidth: 300,
                              label: 'Test Name',
                              hintText: 'NEET, JEE, etc...',
                              onChanged: (x) {
                                context.read<TestCubit>().setTestName(x);
                                debugPrint(x);
                              },
                              initialValue: '',
                              controller: testNameController,
                            ),
                            const VGap(height: 30),
                            TestField(
                              // maxWidth: 300,
                              label: 'Test Code',
                              hintText: 'JAAM24, NEET24, etc...',
                              onChanged: (x) {
                                context.read<TestCubit>().setTestCode(x);
                                debugPrint(x);
                              },
                              initialValue: '',
                              controller: testCodeController,
                            ),
                            const VGap(height: 30),
                            TestField(
                              label: 'Test Description',
                              hintText: 'Enter the test description',
                              onChanged: (x) {
                                context.read<TestCubit>().setTestDescription(x);

                                debugPrint(x);
                              },
                              initialValue: '',
                              controller: testDescriptionController,
                            ),
                            const VGap(height: 30),
                            Row(
                              children: [
                                TestField(
                                  maxWidth: 80,
                                  label: 'Hours',
                                  hintText: '00',
                                  onChanged: (x) {
                                    context
                                        .read<TestCubit>()
                                        .setTimeStampHour(int.parse(x));
                                    debugPrint(
                                        '$x hours ==> ${int.parse(x) * 3600000} milliseconds');
                                  },
                                  initialValue: '00',
                                  controller: timeStampHourController,
                                ),
                                const HGap(width: 20),
                                TestField(
                                  maxWidth: 80,
                                  label: 'Minutes',
                                  hintText: '00',
                                  onChanged: (x) {
                                    context
                                        .read<TestCubit>()
                                        .setTimeStampMinute(int.parse(x));
                                    debugPrint(
                                        '$x minutes ==> ${int.parse(x) * 60000} milliseconds');
                                  },
                                  initialValue: '00',
                                  controller: timeStampMinuteController,
                                ),
                                const HGap(width: 20),
                                TestField(
                                  maxWidth: 80,
                                  label: 'Seconds',
                                  hintText: '00',
                                  onChanged: (x) {
                                    context
                                        .read<TestCubit>()
                                        .setTimeStampSecond(int.parse(x));
                                    debugPrint(
                                        '$x seconds ==> ${int.parse(x) * 1000} milliseconds');
                                  },
                                  initialValue: '00',
                                  controller: timeStampSecondController,
                                ),
                              ],
                            ),
                            const VGap(height: 30),
                            const Text(
                              'Select Date',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w600),
                            ),
                            const VGap(height: 10),
                            SizedBox(
                              width: 300,
                              child: AuthButtonSmall(
                                  label: state.testDate != 0
                                      ? DateTime.fromMillisecondsSinceEpoch(
                                              state.testDate)
                                          .toString()
                                      : DateTime.now().toString(),
                                  onTap: () async {
                                    final result =
                                        await showBoardDateTimePicker(
                                            radius: 3,
                                            context: context,
                                            pickerType:
                                                DateTimePickerType.datetime,
                                            onChanged: (x) {
                                              //
                                            });
                                    if (result != null) {
                                      context.read<TestCubit>().setTestDate(
                                          result.millisecondsSinceEpoch);
                                      debugPrint(result.millisecondsSinceEpoch
                                          .toString());
                                    }
                                  },
                                  outlined: true),
                            ),
                            const VGap(height: 30),
                            ExpandedTestField(
                              // maxWidth: 300,
                              label: 'Test Eligibility',
                              hintText: '',
                              onChanged: (x) => context
                                  .read<TestCubit>()
                                  .setTestEligibility(x),
                              initialValue: '',
                              controller: testEligibilityController,
                            ),
                            const VGap(height: 30),
                            ExpandedTestField(
                              // maxWidth: 300,
                              label: 'Test Syllabus',
                              hintText: '',
                              onChanged: (x) =>
                                  context.read<TestCubit>().setTestSyllabus(x),
                              initialValue: '',
                              controller: testSyllabusController,
                            ),
                            const VGap(height: 30),
                            TestField(
                              // maxWidth: 300,
                              label: 'Test Answer Sheet Link',
                              hintText: '',
                              onChanged: (x) => context
                                  .read<TestCubit>()
                                  .setTestAnswerSheet(x),
                              initialValue: '',
                              controller: answerSheetController,
                            ),
                            const VGap(height: 30),
                            const Text(
                              'Select Result date',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w600),
                            ),
                            const VGap(height: 10),
                            SizedBox(
                              width: 300,
                              child: AuthButtonSmall(
                                  label: state.testDate != 0
                                      ? DateTime.fromMillisecondsSinceEpoch(
                                              state.testDate)
                                          .toString()
                                      : DateTime.now().toString(),
                                  onTap: () async {
                                    final result =
                                        await showBoardDateTimePicker(
                                            radius: 3,
                                            context: context,
                                            pickerType:
                                                DateTimePickerType.datetime,
                                            onChanged: (x) {
                                              //
                                            });
                                    if (result != null) {
                                      context.read<TestCubit>().setResultDate(
                                          result.millisecondsSinceEpoch);
                                      debugPrint(result.millisecondsSinceEpoch
                                          .toString());
                                    }
                                  },
                                  outlined: true),
                            ),
                            const VGap(height: 40),
                            Row(
                              children: [
                                AuthButtonSmall(
                                    label: 'Go Back',
                                    onTap: () => Navigator.pop(context),
                                    outlined: true),
                                const HGap(width: 30),
                                AuthButtonSmall(
                                    label: 'Continue',
                                    onTap: () =>
                                        context.read<TestCubit>().setTest(),
                                    outlined: false),
                              ],
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Questions',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w600),
                            ),
                            const VGap(height: 10),
                            AuthButton(
                              label: 'Add Question',
                              onTap: () => showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3)),
                                  backgroundColor: Colors.white,
                                  child: Container(
                                    constraints:
                                        const BoxConstraints(maxWidth: 800),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: Colors.white),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: Center(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const VGap(height: 70),
                                            const SelectableText(
                                              'Add Question',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 20),
                                            ),
                                            const VGap(height: 50),
                                            ExpandedTestField(
                                                maxWidth: 700,
                                                label: 'Question Text',
                                                hintText: '',
                                                onChanged: (x) => context
                                                    .read<TestCubit>()
                                                    .setQuestionText(x),
                                                initialValue: '',
                                                controller:
                                                    questionTextController),
                                            const VGap(height: 20),
                                            const SelectableText(
                                              'Add Image',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            const VGap(height: 10),
                                            AddImage(
                                                onTap: () => context
                                                    .read<TestCubit>()
                                                    .addQuestionImage(),
                                                image: state.questionImage),
                                            const VGap(height: 20),
                                            TestField(
                                                label:
                                                    'Question Index ( in integer e.g. 1, 2, etc)',
                                                hintText: '',
                                                onChanged: (x) => context
                                                    .read<TestCubit>()
                                                    .setQuestionIndex(
                                                        int.parse(x)),
                                                initialValue: '1',
                                                controller:
                                                    questionIndexController),
                                            const VGap(height: 30),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                TestField(
                                                    maxWidth: 200,
                                                    label: 'Marks',
                                                    hintText: 'in number',
                                                    onChanged: (x) => context
                                                        .read<TestCubit>()
                                                        .setQuestionMarks(
                                                            double.parse(x)),
                                                    initialValue: '',
                                                    controller:
                                                        marksController),
                                                const HGap(width: 30),
                                                TestField(
                                                    maxWidth: 200,
                                                    label: 'Negative Marks',
                                                    hintText: 'in number',
                                                    onChanged: (x) => context
                                                        .read<TestCubit>()
                                                        .setNegativeMarks(
                                                            double.parse(x)),
                                                    initialValue: '',
                                                    controller:
                                                        negativeMarksController),
                                              ],
                                            ),
                                            const VGap(height: 50),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                AuthButtonSmall(
                                                    label: 'Back',
                                                    onTap: () =>
                                                        Navigator.pop(context),
                                                    outlined: true),
                                                // HGap(width: 50),
                                                AuthButtonSmall(
                                                    label: 'Submit',
                                                    onTap: () {
                                                      context
                                                          .read<TestCubit>()
                                                          .setOption();
                                                    },
                                                    outlined: false),
                                              ],
                                            ),
                                            const VGap(height: 70)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              outlined: false,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Question no. 1',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w600),
                            ),
                            const VGap(height: 10),
                            const SelectableText(
                                'I ve written a few thousand words on why traditional “semantic class names” are the reason CSS is hard to maintain, but the truth is you’re never going to believe me until you actually try it. If you can suppress the urge to retch long enough to give it a chance,'),
                            const VGap(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AuthButtonSmall(
                                  label: 'Add Option',
                                  onTap: () => showDialog(
                                    context: context,
                                    builder: (context) => Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3)),
                                      backgroundColor: Colors.white,
                                      child: Container(
                                        constraints:
                                            const BoxConstraints(maxWidth: 800),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            color: Colors.white),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30),
                                        child: Center(
                                          child: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const VGap(height: 70),
                                                const Text(
                                                  'Add Option',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 20),
                                                ),
                                                const VGap(height: 50),
                                                ExpandedTestField(
                                                    maxWidth: 700,
                                                    label: 'Option Text',
                                                    hintText: '',
                                                    onChanged: (x) => context
                                                        .read<TestCubit>()
                                                        .setOptionText(x),
                                                    initialValue: '',
                                                    controller:
                                                        optionTextController),
                                                const VGap(height: 20),
                                                const Text(
                                                  'Add Image',
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                const VGap(height: 10),
                                                AddImage(
                                                    onTap: () => context
                                                        .read<TestCubit>()
                                                        .addOptionImage(),
                                                    image: ''),
                                                const VGap(height: 30),
                                                GroupButton(
                                                  enableDeselect: true,
                                                  buttons: [
                                                    'Is this the right Answer ?? --> ${state.isRight}'
                                                  ],
                                                  onSelected: (value, index,
                                                      isSelected) {
                                                    context
                                                        .read<TestCubit>()
                                                        .setIsRight(isSelected);
                                                    debugPrint(state.isRight
                                                        .toString());
                                                  },
                                                  controller: isRightController,
                                                ),
                                                const VGap(height: 50),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    AuthButtonSmall(
                                                        label: 'Back',
                                                        onTap: () =>
                                                            Navigator.pop(
                                                                context),
                                                        outlined: true),
                                                    AuthButtonSmall(
                                                        label: 'Submit',
                                                        onTap: () {
                                                          if (state
                                                                  .questionId !=
                                                              '') {
                                                            context
                                                                .read<
                                                                    TestCubit>()
                                                                .setOption();
                                                          }
                                                        },
                                                        outlined: false),
                                                  ],
                                                ),
                                                const VGap(height: 70),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  outlined: true,
                                ),
                                AuthButtonSmall(
                                    label: 'Final Submit',
                                    onTap: () {},
                                    outlined: false)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
