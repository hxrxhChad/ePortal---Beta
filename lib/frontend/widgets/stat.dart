import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'index.dart';

List<String> navList = ['Overview', 'History', 'Results', 'Settings'];

class StatNavBar extends StatelessWidget {
  final void Function() onOverViewPressed;
  final void Function() onHistoryPressed;
  final void Function() onResultsPressed;
  final void Function() onSettingsPressed;
  final void Function() onSearchPressed;
  final void Function() onNotificationPressed;
  final void Function() onInfoPressed;
  final void Function() onProfilePressed;
  final String navSelected;
  const StatNavBar(
      {super.key,
      required this.onOverViewPressed,
      required this.onHistoryPressed,
      required this.onResultsPressed,
      required this.onSettingsPressed,
      required this.onSearchPressed,
      required this.onNotificationPressed,
      required this.onInfoPressed,
      required this.onProfilePressed,
      required this.navSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 48,
            decoration: BoxDecoration(
                color: Colors.blue.withOpacity(.1),
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: navList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: index == 0
                        ? onOverViewPressed
                        : index == 1
                            ? onHistoryPressed
                            : index == 2
                                ? onResultsPressed
                                : onSettingsPressed,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: navSelected == 'overview' && index == 0
                                ? Colors.blue
                                : navSelected == 'history' && index == 1
                                    ? Colors.blue
                                    : navSelected == 'results' && index == 2
                                        ? Colors.blue
                                        : navSelected == 'settings' &&
                                                index == 3
                                            ? Colors.blue
                                            : Colors.transparent,
                            borderRadius: BorderRadius.circular(15)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: SelectableText(
                          navList[index].toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: navSelected == 'overview' && index == 0
                                  ? Colors.white
                                  : navSelected == 'history' && index == 1
                                      ? Colors.white
                                      : navSelected == 'results' && index == 2
                                          ? Colors.white
                                          : navSelected == 'settings' &&
                                                  index == 3
                                              ? Colors.white
                                              : Colors.blue,
                              fontSize: 13),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
        const HGap(width: 60),
        Container(
          decoration: BoxDecoration(
              color: Colors.blue.withOpacity(navSelected == 'search' ? 1 : .1),
              borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.all(5),
          child: Center(
              child: IconButton(
            icon: Icon(
              Iconsax.search_normal_1,
              color: navSelected == 'search' ? Colors.white : Colors.blue,
              size: 16,
            ),
            onPressed: onSearchPressed,
          )),
        ),
        const HGap(width: 10),
        Container(
          decoration: BoxDecoration(
              color: Colors.blue.withOpacity(.1),
              borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: navSelected == 'notification'
                        ? Colors.blue
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(15)),
                child: IconButton(
                  icon: Icon(
                    Iconsax.notification,
                    color: navSelected == 'notification'
                        ? Colors.white
                        : Colors.blue,
                    size: 16,
                  ),
                  onPressed: onNotificationPressed,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: navSelected == 'info'
                        ? Colors.blue
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(15)),
                child: IconButton(
                  icon: Icon(
                    Iconsax.information,
                    color: navSelected == 'info' ? Colors.white : Colors.blue,
                    size: 16,
                  ),
                  onPressed: onInfoPressed,
                ),
              ),
            ],
          ),
        ),
        const HGap(width: 20),
        InkWell(
          onTap: onProfilePressed,
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.blue.withOpacity(.2)),
          ),
        ),
        const HGap(width: 10),
        InkWell(
          onTap: onProfilePressed,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                'Hi, Garry Silva',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SelectableText(
                'IIT, Madras',
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
        )
      ],
    );
  }
}

class StatAppearedTile extends StatelessWidget {
  final String percentage;
  final String description;
  final String title;
  final IconData icon;
  final Color color;
  const StatAppearedTile({
    super.key,
    required this.percentage,
    required this.description,
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 13),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Complete',
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                      Text(
                        percentage,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        description,
                        style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.w600,
                            fontSize: 10),
                      )
                    ],
                  ),
                  const HGap(width: 40),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration:
                        BoxDecoration(color: color, shape: BoxShape.circle),
                    child: Icon(
                      icon,
                      size: 14,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              // const VGap(height: 20),
              Text(
                title,
                style: TextStyle(
                    color: Colors.white.withOpacity(.8),
                    fontWeight: FontWeight.w500,
                    fontSize: 11),
              )
            ]),
      ),
    );
  }
}
