import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_project/Commons/commons.dart';
import 'package:starter_project/Features/Home/Bloc/weather_bloc.dart';
import 'package:starter_project/Features/Search/Bloc/searched_location_bloc.dart';
import 'package:starter_project/Features/Search/Model/search_model.dart';
import 'package:starter_project/Utils/app_utils.dart';
import 'package:starter_project/Widgets/neumorphic_button.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    NeumorphicButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(AppSizes.dimen12),
                        child: Icon(
                          Icons.close,
                          size: AppSizes.appBarIconSize,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                onTap: () {
                  var loc = AppUtils.getCurrentLocation();
                  BlocProvider.of<WeatherBloc>(context)
                      .add(GetSearchedWeatherDataEvent(loc.toString()));
                  Navigator.pop(context);
                },
                title: const Text(
                  'Current Location',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.blue,
                      fontSize: AppSizes.bodyText1),
                ),
                trailing: NeumorphicButton(
                    onPressed: () {
                      var loc = AppUtils.getCurrentLocation();
                      BlocProvider.of<WeatherBloc>(context)
                          .add(GetSearchedWeatherDataEvent(loc.toString()));
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(AppSizes.cardCornerRadius),
                      child: Icon(
                        EvaIcons.navigation2,
                        color: AppColors.blue,
                        size: AppSizes.appBarIconSize,
                      ),
                    )),
              ),
              BlocConsumer<SearchedLocationBloc, SearchedLocationState>(
                  listener: (context, state) {
                if (state is SearchedLocationStateLoaded) {}
              }, builder: (context, state) {
                if (state is SearchedLocationStateInitial) {}
                if (state is SearchedLocationStateLoading) {
                  return const Center(child: Text('Loading...'));
                }
                if (state is SearchedLocationStateError) {
                  return const Center(child: Text('No Results'));
                }
                if (state is SearchedLocationStateLoaded) {
                  return Expanded(
                    child: state.searchModel.isNotEmpty
                        ? ListView.separated(
                            itemCount: state.searchModel.length,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (ctx, index) {
                              return ListTile(
                                title: Text(
                                  '${state.searchModel[index].name}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.darkGrey,
                                      fontSize: AppSizes.bodyText1),
                                ),
                                subtitle: Text(
                                  state.searchModel[index].region != ''
                                      ? '${state.searchModel[index].region}, ${state.searchModel[index].country}'
                                      : '${state.searchModel[index].country}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.darkGrey,
                                      fontSize: AppSizes.bodyText2),
                                ),
                                trailing: NeumorphicButton(
                                    onPressed: () {
                                      BlocProvider.of<WeatherBloc>(context).add(
                                          GetSearchedWeatherDataEvent(state
                                              .searchModel[index].name
                                              .toString()));
                                      Navigator.pop(context);
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.all(
                                          AppSizes.cardCornerRadius),
                                      child: Icon(
                                        EvaIcons.plus,
                                        color: AppColors.darkGrey,
                                        size: AppSizes.appBarIconSize,
                                      ),
                                    )),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: AppSizes.kDefaultPadding),
                                child: Divider(height: 1),
                              );
                            },
                          )
                        : const Center(child: Text('No Results Found')),
                  );
                }
                return const Expanded(child: Center(child: Text('No Results')));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
