import 'package:flutter/material.dart' hide BoxShadow, BoxDecoration;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:starter_project/Features/Search/Bloc/searched_location_bloc.dart';

import '../Commons/app_colors.dart';
import '../Commons/app_sizes.dart';

class NeumorphicTextField extends StatelessWidget {
  final TextEditingController controller;
  //final VoidCallback onChanged;

  const NeumorphicTextField(
      {Key? key, required this.controller,
        //required this.onChanged
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.cardCornerRadius),
            color: AppColors.backgroundColor,
            boxShadow: [
              //bottom shadow
              BoxShadow(
                  color: Colors.grey.shade400,
                  offset: const Offset(2, 2),
                  blurRadius: 5,
                  spreadRadius: 1,
                  inset: true),
              //top shadow
              const BoxShadow(
                  color: AppColors.white,
                  offset: Offset(-2, -2),
                  blurRadius: 5,
                  spreadRadius: 1,
                  inset: true),
            ]),
        child: TextFormField(
          autofocus: true,
          onChanged: (value) => BlocProvider.of<SearchedLocationBloc>(context).add(GetSearchedLocationEvent(controller.text.trim().toLowerCase())),
          controller: controller,
          decoration: const InputDecoration(
              hintText: 'Search Location',
              contentPadding:
                  EdgeInsets.symmetric(horizontal: AppSizes.kDefaultPadding),
              border: UnderlineInputBorder(borderSide: BorderSide.none)),
        ));
  }
}
