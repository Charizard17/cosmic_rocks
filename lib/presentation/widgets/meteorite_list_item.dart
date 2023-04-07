import 'package:flutter/material.dart';

import 'package:cosmic_rocks/data/models/meteorite.dart';

class MeteoriteListItem extends StatelessWidget {
  final Meteorite meteorite;
  final VoidCallback onTap;

  const MeteoriteListItem({
    Key? key,
    required this.meteorite,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                meteorite.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Type: ${meteorite.type}',
                style: const TextStyle(fontSize: 14.0),
              ),
              const SizedBox(height: 4.0),
              Text(
                'Year: ${meteorite.year}',
                style: const TextStyle(fontSize: 14.0),
              ),
              const SizedBox(height: 4.0),
              Text(
                'Mass: ${meteorite.mass} g',
                style: const TextStyle(fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
