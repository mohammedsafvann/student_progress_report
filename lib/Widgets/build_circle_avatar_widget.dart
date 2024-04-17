import 'package:flutter/material.dart';
import 'package:progress_report/Widgets/build_icons_widget.dart';

class BuildCircleAvatarWidget extends StatefulWidget {
  final double size;
  final Color iconColor;
  final Function onTap;
  final Widget? chiled;

  const BuildCircleAvatarWidget(
      {super.key,
      required this.size,
      required this.iconColor,
      required this.onTap,
      this.chiled});

  @override
  State<BuildCircleAvatarWidget> createState() => _BuildCircleAvatarState();
}

class _BuildCircleAvatarState extends State<BuildCircleAvatarWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: CircleAvatar(
        backgroundColor: Colors.grey,
        child: BuildIconWidget(
            color: widget.iconColor,
            icon: Icons.add_photo_alternate_outlined,
            size: 40),
        radius: widget.size,
      ),
    );
  }
}
