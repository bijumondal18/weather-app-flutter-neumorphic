import 'package:flutter/material.dart';

import '../Commons/app_sizes.dart';
import '../Widgets/neumorphic_card.dart';

class TemparatureList extends StatelessWidget {
  const TemparatureList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          shrinkWrap: true,
          padding:
          const EdgeInsets.only(left: AppSizes.kDefaultPadding),
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: 130,
              height: 160,
              margin: const EdgeInsets.only(
                  right: AppSizes.kDefaultPadding),
              child: NeumorphicCard(
                  isClickable: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Today'),
                      Text('12'),
                      Row(
                        children: [
                          Text('Clear'),
                        ],
                      ),
                    ],
                  )),
            );
          }),
    );
  }
}
