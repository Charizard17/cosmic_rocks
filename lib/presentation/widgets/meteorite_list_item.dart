import 'package:cosmic_rocks/presentation/pages/meteorite_detail_page.dart';
import 'package:flutter/material.dart';

import 'package:cosmic_rocks/data/models/meteorite.dart';

class MeteoriteListItem extends StatelessWidget {
  final Meteorite meteorite;

  const MeteoriteListItem({Key? key, required this.meteorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  MeteoriteDetailPage(meteorite: meteorite),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                meteorite.name ?? 'N/A',
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text('Class: ${meteorite.recclass ?? 'N/A'}'),
              Text('Year: ${meteorite.year ?? 'N/A'}'),
              Text('Fall: ${meteorite.fall ?? 'N/A'}'),
            ],
          ),
        ),
      ),
    );
  }
}
