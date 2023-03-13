import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:policard_mobile/model/student.dart';

import '../../repository/fetch_repo.dart';

part 'fetch_event.dart';
part 'fetch_state.dart';

class Fetchbloc extends Bloc<FetchEvent, FetchState> {
  Fetchbloc() : super(FetchInitial()) {
    final RepositoryFetchData _repo_fetch = RepositoryFetchData();
    on<FetchEvent>((event, emit) async {
      List<Students> student = await _repo_fetch.fetchStudent();
      print("${student}");
      emit(FetchSuccess(student: student));
    });
  }
}
