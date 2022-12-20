import 'package:flutter/material.dart';

class CttPlusBusyWidget extends StatelessWidget {
  bool busy = false;
  Widget child;

  CttPlusBusyWidget({
    super.key,
    required this.busy,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return busy
        ? Container(
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
        : child;
  }
}
