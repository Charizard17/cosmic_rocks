import 'package:cosmic_rocks/presentation/widgets/meteorite_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/meteorite_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cosmic Rocks'),
      ),
      body: BlocBuilder<MeteoriteBloc, MeteoriteState>(
        builder: (context, state) {
          if (state is MeteoriteLoadInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MeteoriteLoadSuccess) {
            return ListView.builder(
              itemCount: state.meteorites.length,
              itemBuilder: (context, index) {
                final meteorite = state.meteorites[index];
                return MeteoriteListItem(
                  meteorite: meteorite,
                );
              },
            );
          } else if (state is MeteoriteLoadFailure) {
            return const Center(
              child: Text('Failed to load meteorites'),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
