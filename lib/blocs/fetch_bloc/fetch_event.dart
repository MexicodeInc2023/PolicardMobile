part of 'fetch_bloc.dart';

abstract class FetchEvent extends Equatable {}

class GetStudent extends FetchEvent {
  @override
  List<Object> get props => [];
}