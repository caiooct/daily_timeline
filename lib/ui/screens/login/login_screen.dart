import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final emailInput = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'E-mail address',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Colors.white,
              ),
        ),
        const SizedBox(height: 4.0),
        TextFormField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            prefixIcon: const Icon(Icons.mail),
            hintText: 'example@mail.com',
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8.0)),
            fillColor: Colors.white,
            filled: true,
            isDense: true,
          ),
        ),
      ],
    );
    final passwordInput = TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        isDense: true,
        prefixIcon: const Icon(Icons.lock),
        hintText: '******',
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8.0)),
        fillColor: Colors.white,
        filled: true,
      ),
    );
    final continueButton = Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(
                const Size(double.maxFinite, 40),
              ),
              backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.onPrimary),
            ),
            onPressed: () {},
            child: Text(
              'Continue',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        )
      ],
    );
    final googleButton = Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(
                const Size(double.maxFinite, 40),
              ),
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xFF4285F4)),
            ),
            onPressed: () {},
            child: Row(
              children: [
                SvgPicture.asset(
                  width: 32,
                  height: 32,
                  'assets/images/icon_google.svg',
                ),
                const SizedBox(width: 24),
                Text(
                  'Sign in with Google',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ],
            ),
          ),
        )
      ],
    );
    final footerText = Center(
      child: RichText(
        text: TextSpan(
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Colors.white,
                ),
            text: 'By using this app, you agree to our ',
            children: [
              TextSpan(
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                    ),
                text: 'Terms and conditions',
              ),
              TextSpan(
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Colors.white,
                    ),
                text: ' and ',
              ),
              TextSpan(
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                    ),
                text: 'Privacy Policy',
              ),
            ]),
      ),
    );
    return SafeArea(
      top: false,
      child: Material(
        color: Theme.of(context).colorScheme.primary,
        child: Padding(
          padding: EdgeInsets.only(
            left: width * 0.08,
            top: 32.0,
            right: width * 0.08,
            bottom: 8.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 48.0),
              Center(
                child: SvgPicture.asset(
                  width: 240.0,
                  height: 100.0,
                  'assets/images/img_welcome_login.svg',
                ),
              ),
              const SizedBox(height: 48.0),
              Text(
                'Login',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.white,
                    ),
              ),
              const SizedBox(height: 24.0),
              emailInput,
              const SizedBox(height: 8.0),
              Text(
                'Password',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Colors.white,
                    ),
              ),
              const SizedBox(height: 4.0),
              passwordInput,
              const SizedBox(height: 8.0),
              continueButton,
              const SizedBox(height: 24.0),
              Text(
                'Don’t have an account? Sign up',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white,
                    ),
              ),
              const SizedBox(height: 24.0),
              Text(
                'Forgot your password',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white,
                    ),
              ),
              const SizedBox(height: 24.0),
              googleButton,
              const Expanded(child: SizedBox()),
              footerText,
            ],
          ),
        ),
      ),
    );
  }
}
