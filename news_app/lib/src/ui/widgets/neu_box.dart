import 'package:flutter/material.dart';

class NeoBox extends StatelessWidget {
  final Widget child;

  const NeoBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          // Darker Shadow
          BoxShadow(
              color: Colors.grey.shade500,
              blurRadius: 15,
              offset: const Offset(4, 4)),
          // Light Shadow
          const BoxShadow(
              color: Colors.white, blurRadius: 15, offset: Offset(-4, -4))
        ],
      ),
      child: child,
    );
  }
}
