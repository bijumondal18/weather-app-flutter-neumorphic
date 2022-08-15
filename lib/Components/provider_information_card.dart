import 'package:flutter/material.dart';
import 'package:starter_project/Commons/app_colors.dart';
import 'package:starter_project/Commons/app_sizes.dart';

class ProviderInformation extends StatelessWidget {
  const ProviderInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.dimen8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Data provided in part by',
            style: TextStyle(
                fontSize: AppSizes.caption,
                color: AppColors.grey,
                fontWeight: FontWeight.w400),
          ),
          Image(
            image: NetworkImage(
              'https://cdn.weatherapi.com/v4/images/weatherapi_logo.png',
            ),
            width: 70,
            height: 25,
            fit: BoxFit.contain,
          )
        ],
      ),
    );
  }
}
