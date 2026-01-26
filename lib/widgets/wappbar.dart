import 'package:flutter/material.dart';

class WAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Good Afternoon"),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 12, left: 12),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%2Fid%2FOIP.AQcNdjwU5teB-FHbX4TBxwHaFj%3Fpid%3DApi&f=1&ipt=6fcd297adc2ca68b3e39c7dd87285bd145d69ef5223acc23c170a22a1d067b8e&ipo=images",
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
