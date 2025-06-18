// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:nawel/core/helper/shared_preference_helper.dart';
import 'package:nawel/features/authentication/datasource/auth_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthDataSource _authDataSource;


  AuthBloc({required AuthDataSource authRepository})
      : _authDataSource = authRepository,
        super(AuthInitial()) {
    on<SignUpRequest>(_onSignUpRequested);
    on<LoginRequest>(_onLoginRequested);
    on<LogoutRequested>(_onSignOutRequested);
    on<AutoLoginRequested>(_onAutoLoginRequested);
  }

  Future<void> _onSignUpRequested(
      SignUpRequest event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await _authDataSource.signUp(
        email: event.email,
        password: event.password,
      );

      if (user != null) {
        
        emit(Authenticated(email: user.email!));
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onLoginRequested(
      LoginRequest event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await _authDataSource.logIn(
        email: event.email,
        password: event.password,
      );

      if (user != null) {
        await user.reload(); // Reload the user to get the latest status

        
          //await _saveUserSession(event.email, user.displayName);
          emit(Authenticated(
            
            email: event.email,
          ));
          saveLoginStatus(status: true);
        
      } else {
        emit(AuthError(message: "Login failed. Please try again."));
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  void saveLoginStatus({required bool status}) {
    SharedPreferencesHelper.saveBool('loggedin', status);
  }

  // make sure use this method in profile ya Hossam
  Future<void> _onSignOutRequested(
      AuthEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    await _authDataSource.logOut();
    await _clearPreferences();
    emit(Unauthenticated());
  }

  Future<void> _onAutoLoginRequested(
      AutoLoginRequested event, Emitter<AuthState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString("email");
    if (email != null) {
      emit(Authenticated( email: email));
      saveLoginStatus(status: true);
    } else {
      emit(Unauthenticated());
    }
  }







  Future<void> _clearPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('', false);
    await prefs.clear();
  }


}
