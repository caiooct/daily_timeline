import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GoogleButtonWidget extends StatelessWidget {
  const GoogleButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
  }
}
