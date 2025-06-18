import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nawel/core/helper/shared_preference_helper.dart';
import 'package:nawel/core/shared_widgets/default_button.dart';
import 'package:nawel/core/shared_widgets/default_text_form_field.dart';
import 'package:nawel/core/utils/string_validation_util.dart';
import 'package:nawel/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:nawel/features/authentication/presentation/bloc/auth_event.dart';
import 'package:nawel/features/authentication/presentation/bloc/auth_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );
          } else if (state is Authenticated) {
            SharedPreferencesHelper.saveBool('isLoggedIn', true);
            context.go('/applayout');
          } else if (state is AuthError) {
            Navigator.pop(context);
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        100.verticalSpace,
                        Image.asset(
                          'assets/logo.png',
                          height: 300.h,
                          width: 300.w,
                        ),
                        80.verticalSpace,

                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              DefaultTextFormField(
                                controller: _emailController,
                                labelText: 'Email',
                                hintText: 'Enter your email',
                                prefixIcon: Icons.email_outlined,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Email is required';
                                  } else if (!StringValidationUtil.isValidateEmail(
                                    value,
                                  )) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                              ),

                              30.verticalSpace,

                              DefaultTextFormField(
                                controller: _passwordController,
                                labelText: 'Password',
                                hintText: 'Enter your password',
                                prefixIcon: Icons.lock_outlined,
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password is required';
                                  } else if (!StringValidationUtil.isValidatePassword(
                                    value,
                                  )) {
                                    return 'Password must contain uppercase, lowercase, number and special character';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  40.verticalSpace,

                  DefaultButton(onPressed: _handleLogin, text: 'Login'),

                  20.verticalSpace,

                  TextButton(
                    onPressed: _navigateToSignUp,
                    child: Text(
                      'Create an account',
                      style: TextStyle(
                        color: const Color(0xff1877F2),
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        LoginRequest(
          email: _emailController.value.text,
          password: _passwordController.value.text,
        ),
      );
    }
  }

  void _navigateToSignUp() {
    context.go('/register');
  }
}
