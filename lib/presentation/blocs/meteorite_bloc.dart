import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:cosmic_rocks/data/models/meteorite.dart';
import 'package:cosmic_rocks/data/repositories/meteorite_repository.dart';
import 'package:equatable/equatable.dart';

part 'meteorite_event.dart';
part 'meteorite_state.dart';

class MeteoriteBloc extends Bloc<MeteoriteEvent, MeteoriteState> {
  final MeteoriteRepository meteoriteRepository;

  MeteoriteBloc({required this.meteoriteRepository})
      : super(MeteoriteLoadInProgress()) {
    on<MeteoriteLoad>((event, emit) async {
      try {
        final meteorites = await meteoriteRepository.getMeteorites();
        emit(MeteoriteLoadSuccess(meteorites: meteorites));
      } catch (e) {
        emit(MeteoriteLoadFailure(errorMessage: e.toString()));
      }
    });
  }

  @override
  Stream<MeteoriteState> mapEventToState(MeteoriteEvent event) async* {
    if (event is MeteoriteLoad) {
      yield MeteoriteLoadInProgress();
      try {
        final meteorites = await meteoriteRepository.getMeteorites();
        yield MeteoriteLoadSuccess(meteorites: meteorites);
      } catch (e) {
        yield MeteoriteLoadFailure(errorMessage: e.toString());
      }
    }
  }
}
