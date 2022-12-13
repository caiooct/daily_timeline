import 'package:app_flutter/settings/colors.dart';
import 'package:app_flutter/ui/components/elevated_button_component.dart';
import 'package:app_flutter/ui/components/input_text_component.dart';
import 'package:app_flutter/ui/widgets/google_button_widget.dart';
import 'package:flutter/material.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: primary,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create account',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: Colors.white,
                  ),
            ),
            const SizedBox(height: 12.0),
            const InputTextComponent(
              label: "Name",
              hintText: "Name",
              prefixIcon: Icon(Icons.person_outline),
            ),
            const SizedBox(height: 8.0),
            const InputTextComponent(
              label: "Last name",
              hintText: "Last name",
              prefixIcon: Icon(Icons.mail_outline),
            ),
            const SizedBox(height: 8.0),
            const InputTextComponent(
              label: "Password",
              hintText: "********",
              prefixIcon: Icon(Icons.lock),
            ),
            const SizedBox(height: 16.0),
            const ElevatedButtonComponent(),
            const SizedBox(height: 24.0),
            Row(
              children: const [
                Expanded(child: Divider(thickness: 1.0, color: Colors.white)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text("or", style: TextStyle(color: Colors.white)),
                ),
                Expanded(child: Divider(thickness: 1.0, color: Colors.white)),
              ],
            ),
            const SizedBox(height: 24.0),
            const GoogleButtonWidget(),
            const Expanded(child: SizedBox()),
            Center(
              child: RichText(
                text: TextSpan(
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Colors.white,
                        ),
                    text: 'By using this app, you agree to our ',
                    children: [
                      TextSpan(
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Colors.white,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                ),
                        text: 'Terms and conditions',
                      ),
                      TextSpan(
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Colors.white,
                                ),
                        text: ' and ',
                      ),
                      TextSpan(
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Colors.white,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                ),
                        text: 'Privacy Policy',
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
