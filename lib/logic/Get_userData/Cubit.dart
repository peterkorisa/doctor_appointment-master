import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/UserDataGet.dart';
import 'State.dart';

class UserCubit extends Cubit<UserCubitState> {
  final String token;
  final Dio _dio = Dio();

  UserCubit({required this.token}) : super(UserLoading());

  Future<void> fetchUserData() async {
    emit(UserLoading());

    try {
      final response = await fetchUserDataFromAPI();
      if (response.status) {
        emit(UserLoaded(response.data));
      } else {
        emit(UserError(response.message));
      }
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<UserResponse> fetchUserDataFromAPI() async {
    const url = 'https://vcare.integration25.com/api/user/profile';

    try {
      final response = await _dio.get(
        url,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        return UserResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
}