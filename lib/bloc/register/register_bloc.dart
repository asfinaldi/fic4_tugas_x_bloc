// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:fic4_tugas_x_bloc/data/datasources/api_datasource.dart';
import 'package:fic4_tugas_x_bloc/data/models/request/register_model.dart';
import 'package:fic4_tugas_x_bloc/data/models/response/register_response.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final ApiDatasources datasources;
  RegisterBloc(
    this.datasources,
  ) : super(RegisterInitial()) {
    on<SaveRegisterEvent>((event, emit) async {
      emit(RegisterLoading());
      final result = await datasources.register(event.request);
      print(result);
      emit(RegisterLoaded(model: result));
    });
  }
}
