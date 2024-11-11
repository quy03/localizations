import 'package:flutter/material.dart';
import 'package:flutter_app_localizations_provider/localization/app_localization.dart';
import 'package:flutter_app_localizations_provider/provider/current_data.dart';
import 'package:provider/provider.dart';

import '../data/default_data.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final DefaultData defaultData = DefaultData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(2),
        ),
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Let's speak          "),
                  Consumer<CurrentData>(builder: (BuildContext context,
                      CurrentData currentData, Widget? child) {
                    return Container(
                      width: 100,
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: DropdownButton(
                        value: currentData.currentLanguage,
                        icon: const Icon(
                          Icons.arrow_downward,
                          color: Colors.black,
                        ),
                        iconSize: 20,
                        elevation: 0,
                        style: const TextStyle(color: Colors.black),
                        underline: Container(
                          height: 1,
                        ),
                        dropdownColor: Colors.indigo,
                        items: defaultData.languageListDefault
                            .map<DropdownMenuItem<String>>(
                          (String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          },
                        ).toList(),
                        onChanged: (String? value) {
                          currentData.changLocale(value!);
                        },
                      ),
                    );
                  }),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                AppLocalization.of(context)!.translate('hello-word'),
                style: const TextStyle(
                  color: Colors.indigo,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
