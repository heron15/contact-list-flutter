import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';

class GridItem extends StatelessWidget {
  const GridItem({
    super.key,
    required this.name,
    required this.number,
    required this.onLongPressed,
  });

  final String? name;
  final String? number;
  final VoidCallback? onLongPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPressed,
      child: Card(
        color: AppColor.cardBg,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.person_outline_rounded,
                    size: 40,
                    color: AppColor.userIconColor,
                  ),
                  Text(
                    name!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColor.red,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    number!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.call,
                  color: AppColor.callIconColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
