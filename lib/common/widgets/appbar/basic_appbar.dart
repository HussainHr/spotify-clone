import 'package:flutter/material.dart';
import 'package:spotify_clone_flutter/common/helpers/is_dark_mode.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget{
  final Widget ? title;
  const BasicAppBar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      // leadingWidth: 70,
      scrolledUnderElevation: 0,
      centerTitle: true,
      title: title ?? const Text(""),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: context.isDarkMode
                  ? Colors.white.withOpacity(0.03)
                  : Colors.black.withOpacity(0.03),
              shape: BoxShape.circle),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: context.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
