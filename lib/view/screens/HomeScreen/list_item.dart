import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.name,
    required this.number,
    this.onLongPressed,
  });

  final String? name;
  final String? number;
  final VoidCallback? onLongPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.cardBg,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        onLongPress: onLongPressed,
        child: ListTile(
          title: Text(
            name!,
            style: const TextStyle(
              color: AppColor.red,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          subtitle: Text(
            number!,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
          ),
          leading: const Icon(
            Icons.person_outline_rounded,
            size: 40,
            color: AppColor.userIconColor,
          ),
          trailing: const Icon(
            Icons.call,
            color: AppColor.callIconColor,
          ),
        ),
      ),
    );
  }
}
