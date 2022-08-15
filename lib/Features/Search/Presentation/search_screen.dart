import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_project/Commons/commons.dart';
import 'package:starter_project/Features/Search/Bloc/searched_location_bloc.dart';
import 'package:starter_project/Features/Search/Model/search_model.dart';
import 'package:starter_project/Widgets/neumorphic_card.dart';
import 'package:starter_project/Widgets/neumorphic_text_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

   List<SearchModel> searchedLocation = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SearchedLocationBloc(),
        child: SafeArea(
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
              BlocConsumer<SearchedLocationBloc, SearchedLocationState>(
                  listener: (context, state) {
                if (state is SearchedLocationStateLoaded) {}
              }, builder: (context, state) {

                if (state is SearchedLocationStateInitial) {
                  //TODO return some predefined locations here...
                  //or build a new listview widget or grid view widget here
                  //for initial predefined countries list
                  //so that user can select location form that list too.
                }
                if (state is SearchedLocationStateLoading) {
                  return const Center(child: Text('Loading...'));
                }
                if (state is SearchedLocationStateLoaded) {
                  return Expanded(
                    child: ListView.builder(
                            itemCount: state.searchModel.length,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: ( ctx, index) {
                              return ListTile(
                                title: Text(
                                  '${state.searchModel[index].name}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.darkGrey,
                                      fontSize: AppSizes.bodyText1),
                                ),
                                subtitle: Text(
                                  '${state.searchModel[index].region}, ${state.searchModel[index].country}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.darkGrey,
                                      fontSize: AppSizes.bodyText2),
                                ),
                                trailing: const Icon(EvaIcons.plus),
                              );
                            },
                          ),
                  );
                }
                return Container();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
