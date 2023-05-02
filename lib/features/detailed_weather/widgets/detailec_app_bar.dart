import 'package:flutter/material.dart';

class DetailedAppBAr extends StatelessWidget {
  final void Function() func;
  const DetailedAppBAr({
    super.key,
    required this.func,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: func,
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
    );
  }
}
