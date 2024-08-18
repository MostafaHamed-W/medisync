import 'package:flutter/material.dart';
import 'package:medisync/core/helpers/spacing.dart';
import 'package:medisync/core/theming/styles.dart';

class OrSigninDivider extends StatelessWidget {
  const OrSigninDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          const Expanded(child: Divider()),
          horizentalWidth(5),
          Text(
            'Or sign in with',
            style: TextStyles.font12BlackGrayRegular,
          ),
          horizentalWidth(5),
          const Expanded(child: Divider()),
        ],
      ),
    );
  }
}
