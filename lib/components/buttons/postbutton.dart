import 'package:flutter/material.dart';

class MyPostButton extends StatelessWidget {
  final Function()? onTap;
  const MyPostButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.secondary,
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(left: 10),
        child: Center(
          child: Icon(
            Icons.send,
            color: Theme.of(context).colorScheme.primary,
            ),
        ),
      ),
    );
  }
}