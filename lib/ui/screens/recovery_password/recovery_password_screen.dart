import 'package:app_flutter/settings/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../components/elevated_button_component.dart';
import '../../components/input_text_component.dart';

class RecoveryPasswordScreen extends StatelessWidget {
  const RecoveryPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        elevation: 0,
        title: Text(
          'Recovery password',
          style: Theme.of(context).textTheme.headline4!.copyWith(
                color: Colors.white,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            InputTextComponent(
              label: "E-mail address",
              hintText: "example@mail.com",
              prefixIcon: Icon(Icons.mail_outline),
            ),
            SizedBox(height: 16.0),
            ElevatedButtonComponent(),
          ],
        ),
      ),
    );
  }
}
