part of 'meteorite_bloc.dart';

abstract class MeteoriteState extends Equatable {
  const MeteoriteState();

  @override
  List<Object?> get props => [];
}

class MeteoriteLoadInProgress extends MeteoriteState {}

class MeteoriteLoadSuccess extends MeteoriteState {
  final List<Meteorite> meteorites;

  const MeteoriteLoadSuccess({required this.meteorites});

  @override
  List<Object?> get props => [meteorites];
}

class MeteoriteLoadFailure extends MeteoriteState {
  final String errorMessage;

  const MeteoriteLoadFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
