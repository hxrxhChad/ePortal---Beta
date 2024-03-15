import 'package:flutter/material.dart';

import 'index.dart';

class OptionBox extends StatelessWidget {
  final int index;
  final String option;
  final int selectedAnswer;
  const OptionBox({
    super.key,
    required this.index,
    required this.option,
    required this.selectedAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 97,
      decoration: BoxDecoration(
          color: index == selectedAnswer ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(7)),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == selectedAnswer
                    ? Colors.white
                    : Colors.blue.withOpacity(.1)),
            child: Center(
              child: Text(
                  index == 0
                      ? 'A'
                      : index == 1
                          ? 'B'
                          : index == 2
                              ? 'C'
                              : index == 3
                                  ? 'D'
                                  : 'E',
                  style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 11,
                      fontWeight: FontWeight.w600)),
            ),
          ),
          const HGap(width: 20),
          Text(
            option,
            style: TextStyle(
                color: index == selectedAnswer ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}

class IndexBox extends StatelessWidget {
  final int index;
  final int selected;
  const IndexBox({
    super.key,
    required this.index,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue.withOpacity(index == selected ? 1 : .1)),
      child: Center(
        child: Text(index.toString(),
            style: TextStyle(
                color: index == selected ? Colors.white : Colors.blue,
                fontSize: 11,
                fontWeight: FontWeight.w600)),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final IconData icon;
  final String label;
  const PrimaryButton({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(7)),
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600),
          ),
          const HGap(width: 10),
          Icon(
            icon,
            color: Colors.white,
            size: 17,
          ),
        ],
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String label;
  const SecondaryButton(
      {super.key,
      required this.color,
      required this.icon,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color.withOpacity(.1), borderRadius: BorderRadius.circular(7)),
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
            size: 17,
          ),
          const HGap(width: 10),
          Text(
            label,
            style: TextStyle(color: color, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

class QuestionImageBox extends StatelessWidget {
  const QuestionImageBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: 700,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(.05),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}

class TimerBox extends StatelessWidget {
  const TimerBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
          color: Colors.red.withOpacity(.1),
          borderRadius: BorderRadius.circular(7)),
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Time left',
            style: TextStyle(
                color: Colors.red, fontSize: 11, fontWeight: FontWeight.w500),
          ),
          Text(
            '01:07:44',
            style: TextStyle(
                color: Colors.red, fontSize: 13, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class QuestionTitle extends StatelessWidget {
  final String title;
  const QuestionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(7)),
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontWeight: FontWeight.w600, color: Colors.black54),
        ));
  }
}
