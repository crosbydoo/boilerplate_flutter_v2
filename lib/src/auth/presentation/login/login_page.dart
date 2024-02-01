import 'package:bloc_skeleton/common_ui/widgets/common_button.dart';
import 'package:bloc_skeleton/common_ui/widgets/common_textformfield.dart';
import 'package:bloc_skeleton/src/auth/presentation/login/auth_bloc.dart';
import 'package:bloc_skeleton/src/main/presentation/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

class LoginPage extends StatefulWidget {
  static const route = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final isRemember = ValueNotifier<bool>(false);
  final _globalKey = GlobalKey<FormState>();

  final _inputNik = TextEditingController();
  final _inputPass = TextEditingController();

  late AuthBloc _authBloc;

  @override
  void initState() {
    _authBloc = AuthBloc(
      authLoginUseCase: GetIt.instance(),
    );
    super.initState();
  }

  void sendLogin() {
    if (_globalKey.currentState?.validate() == true) {
      _authBloc.add(AuthLoginPostEvent(
        nik: _inputNik.text.trim(),
        password: _inputPass.text.trim(),
      ));
    }
  }

  @override
  void dispose() {
    _inputNik.dispose();
    _inputPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthBloc, AuthLoginState>(
          bloc: _authBloc,
          listener: (context, state) {
            print('check $state');
            if (state is AuthLoginLoadingState) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (ctx) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
            } else if (state is AuthLoginFailedState) {
              Navigator.pop(context);
              Fluttertoast.showToast(
                msg: state.data.error?.message ?? '',
                backgroundColor: Colors.black.withOpacity(0.65),
              );
              print('check ${state.data.error}');
            } else if (state is AuthLoginSuccessState) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                MainPage.route,
                (route) => false,
              );
            }
          },
          builder: (context, state) {
            return Form(
              key: _globalKey,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Login to Madhani QHSE Auto'),
                    const SizedBox(height: 20),
                    const Text('NIK'),
                    CommonTextForm(
                      hint: 'Masukan NIK',
                      obscured: false,
                      icon: Icons.alternate_email_rounded,
                      controller: _inputNik,
                    ),
                    const SizedBox(height: 10),
                    const Text('Password'),
                    CommonTextForm(
                      hint: 'Masukan Password',
                      obscured: true,
                      icon: Icons.alternate_email_rounded,
                      controller: _inputPass,
                    ),
                    ValueListenableBuilder(
                      valueListenable: isRemember,
                      builder: (BuildContext context, value, Widget? child) {
                        return CheckboxListTile(
                          onChanged: (value) {
                            isRemember.value = !isRemember.value;
                          },
                          value: isRemember.value,
                          title: const Text('Remember Me'),
                          controlAffinity: ListTileControlAffinity.leading,
                        );
                      },
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: CommonButton(
                        onPressed: sendLogin,
                        text: 'halo',
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
