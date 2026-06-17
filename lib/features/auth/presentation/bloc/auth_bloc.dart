import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failure.dart';
import '../../../auth/presentation/bloc/login_event.dart';
import '../../../auth/presentation/bloc/login_state.dart';
import '../../../auth/domain/repositories/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(LoginInitial()) {
    on<LoginRequested>(_onLoginRequested);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoginLoading());
    try {
      // 1. Call the Repository (Domain Contract)
      final result = await authRepository.loginWithCredentials(
        email: event.email,
        password: event.password,
      );

      // 2. Process the Either<Failure, T> result
      result.fold(
        (failure) {
          // Failure case (Left side)
          emit(LoginFailure(failure));
        },
        (token) {
          // Success case (Right side)
          emit(LoginSuccess(token));
        },
      );
    } catch (e) {
      // Catch unexpected exceptions
      emit(LoginFailure(ServerFailure('Login Failed')));
    }
  }
}
