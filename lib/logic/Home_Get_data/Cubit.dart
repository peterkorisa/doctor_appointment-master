import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:doctor_appointment/logic/Home_Get_data/State.dart';

import '../../data/HomeDataModel.dart';


class SpecializationsCubit extends Cubit<SpecializationsState> {
  final Dio _dio;

  SpecializationsCubit()
      : _dio = Dio(), // Initialize Dio instance
        super(SpecializationsInitial());

  Future<void> fetchSpecializations() async {
    emit(SpecializationsLoading());
    try {

      final response = await _dio.get('https://vcare.integration25.com/api/home/index');

      if (response.statusCode == 200) {
        final data = response.data;
        final List<Specialization> specializations = (data['data'] as List)
            .map((json) => Specialization.fromJson(json))
            .toList();

        emit(SpecializationsLoaded(specializations: specializations));
      } else {
        emit(SpecializationsError(
            error: 'Failed to load data with status code: ${response.statusCode}'));
      }
    } catch (e) {
      emit(SpecializationsError(error: e.toString()));
    }
  }
}
