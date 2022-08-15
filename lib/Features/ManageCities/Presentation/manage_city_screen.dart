import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart' hide BoxShadow, BoxDecoration;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import 'package:starter_project/Commons/commons.dart';
import 'package:starter_project/Features/Home/Bloc/weather_bloc.dart';
import 'package:starter_project/Widgets/custom_appbar.dart';
import 'package:starter_project/Widgets/neumorphic_card.dart';

class ManageCitiesScreen extends StatelessWidget {
  final WeatherStateLoaded state;

  const ManageCitiesScreen({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          state: state, title: 'Manage Cities', icon: AppIcons.city),
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
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Search Cities',
                    suffixIcon: Icon(EvaIcons.search),
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              )),
        ),
        //const SizedBox(height: AppSizes.kDefaultPadding),
        Expanded(
          child: GridView.builder(
            itemCount: 15,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(
                        left: AppSizes.kDefaultPadding,
                        right: AppSizes.kDefaultPadding,
                        top: AppSizes.kDefaultPadding),
                    child: NeumorphicCard(
                      child: Padding(
                        padding: EdgeInsets.all(AppSizes.kDefaultPadding),
                        child: Text(
                          'London',
                          style: TextStyle(
                              color: AppColors.darkGrey,
                              fontSize: AppSizes.headline6,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              childAspectRatio: 2,
              crossAxisCount: 3,
            ),
          ),
        )
      ],
    );
  }
}
