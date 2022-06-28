import 'package:flutter/material.dart';

class ShrinkInAndOutFAB extends StatefulWidget {
  const ShrinkInAndOutFAB({
    Key? key,
    required this.child,
    required this.onPressed,
    required this.shrink,
  }) : super(key: key);

  final Widget child;
  final Function() onPressed;
  final bool shrink;

  @override
  State<ShrinkInAndOutFAB> createState() => _ShrinkInAndOutFABState();
}

class _ShrinkInAndOutFABState extends State<ShrinkInAndOutFAB> {
  @override
  Widget build(BuildContext context) {
    double height = widget.shrink ? 0 : 55;

    return Stack(
      children: [
        const SizedBox(height: 55),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          constraints: BoxConstraints(maxHeight: height),
          child: FloatingActionButton(
            onPressed: widget.onPressed,
            child: widget.shrink ? const SizedBox() : widget.child,
          ),
        ),
      ],
    );
  }
}
