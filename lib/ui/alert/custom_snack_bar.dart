
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

/// Popup widget that you can use by default to show some information
class CustomSnackBar extends StatefulWidget {
  const CustomSnackBar.success({
    super.key,
    required this.message,
    this.icon = const Icon(
      Icons.check_circle_outline,
      color: CoreColors.success,
      size: 24,
    ),
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: CoreColors.white,
    ),
    this.backgroundColor = CoreColors.white,
    this.borderBottomColor = CoreColors.success,
    this.widget,
  });

  const CustomSnackBar.info({
    super.key,
    required this.message,
    this.widget,
    this.icon = const Icon(
      Icons.info_outline,
      color: CoreColors.info,
      size: 24,
    ),
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: CoreColors.white,
    ),
    this.backgroundColor = CoreColors.white,
    this.borderBottomColor = CoreColors.info,
  });

  const CustomSnackBar.error({
    super.key,
    required this.message,
    this.widget,
    this.icon = const Icon(
      Icons.close_outlined,
      color: CoreColors.error,
      size: 24,
    ),
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: CoreColors.white,
    ),
    this.backgroundColor = CoreColors.white,
    this.borderBottomColor = CoreColors.error,
  });

  const CustomSnackBar.warning({
    super.key,
    required this.message,
    this.widget,
    this.icon = const Icon(
      Icons.warning_outlined,
      color: CoreColors.warning,
      size: 24,
    ),
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: CoreColors.white,
    ),
    this.backgroundColor = CoreColors.white,
    this.borderBottomColor = CoreColors.warning,
  });

  final String message;
  final Widget icon;
  final Color backgroundColor;
  final TextStyle textStyle;
  final Widget? widget;
  final Color borderBottomColor;

  @override
  CustomSnackBarState createState() => CustomSnackBarState();
}

class CustomSnackBarState extends State<CustomSnackBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 26.5),
      decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border(
              bottom: BorderSide(width: 3, color: widget.borderBottomColor))),
      child: Row(
        children: [
          widget.icon,
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: widget.widget ??
                Text(widget.message,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: const Color(0xFF656161),
                      fontWeight: FontWeight.w400
                    )),
          ),
          const SizedBox(
            width: 8,
          ),
          const Icon(Icons.close_outlined)
        ],
      ),
    );
  }
}
