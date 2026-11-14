import 'package:flutter/material.dart';

class PopupOption<T> {
  final T value;
  final String label;
  const PopupOption({required this.value, required this.label});
}

class MoreOptionsPopup<T> extends StatelessWidget {
  final Widget? icon;
  final Widget child;
  final List<PopupOption<T>> options;
  final ValueChanged<T> onSelected;
  const MoreOptionsPopup({
    super.key,
    this.icon,
    required this.child,
    required this.onSelected,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: .topEnd,
      children: [
        child,
        PopupMenuButton<T>(
          onSelected: onSelected,
          icon: icon ?? Icon(Icons.more_vert),
          itemBuilder: (context) => [
            ...options.map(
              (o) => PopupMenuItem<T>(value: o.value, child: Text(o.label)),
            ),
          ],
        ),
      ],
    );
  }
}
