import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/index.dart';

class QuestionView extends StatelessWidget {
  const QuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100.withOpacity(.7),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const QuestionTitle(
              title:
                  'Physics - Indian Institute of Science/ Indian Institutes of Technology',
            ),
            const VGap(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7)),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return IndexBox(
                            index: index,
                            selected: 5,
                          );
                        }),
                  ),
                ),
                const HGap(width: 15),
                const Expanded(child: TimerBox())
              ],
            ),
            const VGap(height: 20),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      flex: 7,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 30),
                        child: const SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SelectableText(
                                'What is the difference between Molarity and Molality?',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              VGap(height: 20),
                              QuestionImageBox()
                            ],
                          ),
                        ),
                      )),
                  const HGap(width: 15),
                  Expanded(
                      flex: 3,
                      child: ListView.builder(
                          itemCount: 4,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return OptionBox(
                              index: index,
                              option: '3/2',
                              selectedAnswer: 1,
                            );
                          })),
                ],
              ),
            ),
            const VGap(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SecondaryButton(
                  color: Colors.red,
                  icon: CupertinoIcons.escape,
                  label: 'Exit',
                ),
                Row(
                  children: [
                    SecondaryButton(
                      color: Colors.blue,
                      icon: CupertinoIcons.arrow_left,
                      label: 'Previous',
                    ),
                    HGap(width: 30),
                    PrimaryButton(
                      icon: CupertinoIcons.arrow_right,
                      label: 'Next',
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
