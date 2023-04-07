part of 'meteorite_bloc.dart';

abstract class MeteoriteEvent extends Equatable {
  const MeteoriteEvent();

  @override
  List<Object> get props => [];
}

class MeteoriteLoad extends MeteoriteEvent {}
