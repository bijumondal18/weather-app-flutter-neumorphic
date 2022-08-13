import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart' hide BoxShadow, BoxDecoration;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import 'package:starter_project/Commons/commons.dart';
import 'package:starter_project/Widgets/neumorphic_card.dart';

class ManageCitiesScreen extends StatelessWidget {
  const ManageCitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Cities'),
      ),
      body: const _BuildBody(),
    );
  }
}

class _BuildBody extends StatefulWidget {
  const _BuildBody({Key? key}) : super(key: key);

  @override
  State<_BuildBody> createState() => _BuildBodyState();
}

class _BuildBodyState extends State<_BuildBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(AppSizes.kDefaultPadding),
          child: NeumorphicCard(
              isClickable: true,
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Search Cities',
                    suffixIcon: Icon(EvaIcons.search),
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              )),
        ),
        //const SizedBox(height: AppSizes.kDefaultPadding),
        Expanded(
          child: ListView.separated(
            itemCount: 15,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                    left: AppSizes.kDefaultPadding,
                    right: AppSizes.kDefaultPadding,
                    top: AppSizes.kDefaultPadding),
                child: NeumorphicCard(
                  isClickable: false,
                  child: Padding(
                    padding: const EdgeInsets.all(AppSizes.kDefaultPadding),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const NeumorphicCard(
                            isClickable: true,
                            child: Padding(
                              padding: EdgeInsets.all(AppSizes.dimen8),
                              child: Icon(EvaIcons.navigation2),
                            )),
                        const SizedBox(width: AppSizes.kDefaultPadding),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'London',
                                style: TextStyle(
                                    color: AppColors.darkGrey,
                                    fontSize: AppSizes.headline6,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'London',
                                style: TextStyle(
                                    color: AppColors.darkGrey,
                                    fontSize: AppSizes.bodyText2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 8);
            },
          ),
        )
      ],
    );
  }
}
