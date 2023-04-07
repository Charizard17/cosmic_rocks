import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/pages/home_page.dart';
import 'data/repositories/meteorite_repository.dart';
import 'presentation/blocs/meteorite_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MeteoriteRepository meteoriteRepository = MeteoriteRepository();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cosmic Rocks',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: BlocProvider(
        create: (context) =>
            MeteoriteBloc(meteoriteRepository: meteoriteRepository)
              ..add(MeteoriteLoad()),
        child: const HomePage(),
      ),
    );
  }
}
