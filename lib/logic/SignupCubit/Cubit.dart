import 'package:dio/dio.dart';
import 'package:doctor_appointment/core/endpoint.dart';
import 'package:doctor_appointment/data/UserData_model.dart';
import 'package:doctor_appointment/logic/SignupCubit/State.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  final Dio dio = Dio();
  late UserModel userModel;
  Future<void> Signup(UserModel user) async {
    emit(SignUpLoadingState());

    try {
      // Set headers before making the request
      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };

      final response = await dio.post(
        "https://vcare.integration25.com/api/auth/register",
        data: user.toJson(),
        options: Options(
          validateStatus: (status) {
            return status! < 500; // Accept all status codes below 500
          },
        ),
      );

      if (response.statusCode == 200) {
        final token = response.data['data']['token'];
        emit(SignUpSuccessState(token));
        userModel = user;
      } else if (response.statusCode == 422) {
        // Handle validation errors
        final errors = response.data['errors'] ?? response.data['message'];
        String errorMessage = '';

        if (errors is Map) {
          // If errors is a map of field-specific errors
          errorMessage = errors.values
              .expand((e) => e is List ? e : [e.toString()])
              .join('\n');
        } else {
          // If errors is a simple message
          errorMessage = errors.toString();
        }

        emit(SignUpErrorState(errorMessage));
      } else {
        emit(SignUpErrorState(
            response.data['message'] ?? 'Failed to sign up: ${response.statusMessage ?? 'Unknown error'}'
        ));
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 422) {
        final errors = e.response?.data['errors'] ?? e.response?.data['message'];
        String errorMessage = '';

        if (errors is Map) {
          errorMessage = errors.values
              .expand((e) => e is List ? e : [e.toString()])
              .join('\n');
        } else {
          errorMessage = errors.toString();
        }

        emit(SignUpErrorState(errorMessage));
      } else {
        emit(SignUpErrorState(e.message ?? 'An error occurred during sign up'));
      }
    } catch (e) {
      emit(SignUpErrorState(e.toString()));
    }
  }
}