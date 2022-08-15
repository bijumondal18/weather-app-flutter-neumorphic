import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:starter_project/Commons/commons.dart';
import 'package:starter_project/Widgets/neumorphic_card.dart';
import 'package:starter_project/Widgets/neumorphic_text_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              color: AppColors.backgroundColor,
              margin: const EdgeInsets.symmetric(
                  horizontal: AppSizes.kDefaultPadding),
              child: Row(
                children: [
                  Expanded(
                      child: NeumorphicTextField(
                    controller: _searchController,
                  )),
                  const SizedBox(width: AppSizes.kDefaultPadding),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const NeumorphicCard(
                      child: Padding(
                        padding: EdgeInsets.all(AppSizes.dimen12),
                        child: Icon(
                          Icons.close,
                          size: AppSizes.appBarIconSize,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return const ListTile(
                    title: Text(
                      'Location Name',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkGrey,
                          fontSize: AppSizes.bodyText1),
                    ),
                    subtitle: Text(
                      'Location region, country',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: AppColors.darkGrey,
                          fontSize: AppSizes.bodyText2),
                    ),
                    trailing: Icon(EvaIcons.plus),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
