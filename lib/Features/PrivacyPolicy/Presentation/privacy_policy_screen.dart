import 'dart:io';

import 'package:flutter/material.dart';
import 'package:starter_project/Commons/commons.dart';
import 'package:starter_project/Features/Home/Bloc/weather_bloc.dart';
import 'package:starter_project/Widgets/custom_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  final WeatherStateLoaded state;

  const PrivacyPolicyScreen({Key? key, required this.state}) : super(key: key);

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  void initState() {
    super.initState();
    WebView.platform = Platform.isAndroid ? SurfaceAndroidWebView() : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Privacy Policy',
          icon: AppIcons.privacyPolicy,
          onBackPressed: () {
            Navigator.pop(context);
          },
          state: widget.state,
        ),
        body: const WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: 'https://www.weatherapi.com/privacy.aspx',
        ));
  }
}
