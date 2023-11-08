import 'package:flutter/material.dart';

class AppGradientContainer extends StatelessWidget {
  const AppGradientContainer({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF154845),
            Color(0xFF246f75),
            Color(0xFF2d958e),
          ],
        ),
      ),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: child,
      ),
    );
  }
}
