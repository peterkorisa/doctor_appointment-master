import 'package:dio/dio.dart';
import 'package:doctor_appointment/logic/Login_cubit/State.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  final Dio dio = Dio();

  Future<void> login(String email, String password) async {
    emit(LoginLoadingState());

    try {
      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };

      final response = await dio.post(
        "https://vcare.integration25.com/api/auth/login",
        data: {
          'email': email,
          'password': password,
        },
        options: Options(
          validateStatus: (status) {
            return status! < 500; // Accept all status codes below 500
          },
        ),
      );

      if (response.statusCode == 200) {
        final token = response.data['data']['token'];
        emit(LoginSuccessState(token));
      } else if (response.statusCode == 422) {
        // Handle validation errors
        final errors = response.data['errors'] ?? response.data['message'];
        String errorMessage = '';

        if (errors is Map) {
          errorMessage = errors.values
              .expand((e) => e is List ? e : [e.toString()])
              .join('\n');
        } else {
          errorMessage = errors.toString();
        }

        emit(LoginErrorState(errorMessage));
      } else {
        emit(LoginErrorState(
            response.data['message'] ?? 'Failed to log in: ${response.statusMessage ?? 'Unknown error'}'
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

        emit(LoginErrorState(errorMessage));
      } else {
        emit(LoginErrorState(e.message ?? 'An error occurred during login'));
      }
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }
}