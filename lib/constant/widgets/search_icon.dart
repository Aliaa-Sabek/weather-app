

import 'package:flutter/material.dart';
import 'package:weather_alarm_app/views/search_view.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) {
            return const SearchView();
          }));
        },
        icon: Icon(
          Icons.search,
          size: 30,
        ),
      ),
    );
  }
}
