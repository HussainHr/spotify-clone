import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone_flutter/common/widgets/appbar/basic_appbar.dart';
import 'package:spotify_clone_flutter/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone_flutter/core/config/assets/app_vestors.dart';
import 'package:spotify_clone_flutter/data/models/auth/sign_in_user.dart';
import 'package:spotify_clone_flutter/domain/entities/usecases/auth/sign_in.dart';
import 'package:spotify_clone_flutter/presentation/auth/pages/sign_up_page.dart';
import '../../../core/config/theme/app_colors.dart';
import '../../../service_locator.dart';
import '../../home/pages/home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      bottomNavigationBar: _signUpText(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                _registerText(),
                const SizedBox(
                  height: 40,
                ),
                _emailField(context),
                const SizedBox(
                  height: 20,
                ),
                _passwordField(context),
                const SizedBox(
                  height: 20,
                ),
                _isLoading
                    ? const CircularProgressIndicator() // Loader while signing in
                    : BasicAppButton(
                  title: "Sign In",
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        _isLoading = true;
                      });
                      var result = await sl<SignInUseCase>().call(
                        params: SignInUserModel(
                            email: _email.text, password: _password.text),
                      );

                      result.fold((l) {
                        var snackBar = SnackBar(
                          content: Text(
                            l,
                            style: const TextStyle(color: Colors.white),
                          ),
                          backgroundColor: AppColors.primary,
                          behavior: SnackBarBehavior.floating,
                        );
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar);
                      }, (r) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                const HomePage()),
                                (route) => false);
                      });

                      setState(() {
                        _isLoading = false;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      'Sign In',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      textAlign: TextAlign.center,
    );
  }

  Widget _emailField(BuildContext context) {
    return TextFormField(
      controller: _email,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(hintText: 'Enter user name or email')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return 'Please enter a valid email address';
        }
        return null;
      },
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextFormField(
      controller: _password,
      obscureText: true,
      decoration: const InputDecoration(hintText: 'Password')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        } else if (value.length < 6) {
          return 'Password must be at least 6 characters long';
        }
        return null;
      },
    );
  }

  Widget _signUpText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Not a member?',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SignUpPage()));
            },
            child: const Text('Register Now'),
          ),
        ],
      ),
    );
  }
}

//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:spotify_clone_flutter/common/widgets/appbar/basic_appbar.dart';
// import 'package:spotify_clone_flutter/common/widgets/button/basic_app_button.dart';
// import 'package:spotify_clone_flutter/core/config/assets/app_vestors.dart';
// import 'package:spotify_clone_flutter/domain/entities/usecases/auth/sign_in.dart';
// import 'package:spotify_clone_flutter/presentation/auth/bloc/sign_in_bloc.dart';
// import 'package:spotify_clone_flutter/presentation/auth/pages/sign_up_page.dart';
// import '../../root/pages/home_page.dart';
//
// class SignInPage extends StatelessWidget {
//   SignInPage({super.key});
//
//   final TextEditingController _email = TextEditingController();
//   final TextEditingController _password = TextEditingController();
//   SignInUseCase signInUseCase = SignInUseCase();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => SignInBloc(signInUseCase),
//       child: Scaffold(
//         appBar: BasicAppBar(
//           title: SvgPicture.asset(
//             AppVectors.logo,
//             height: 40,
//             width: 40,
//           ),
//         ),
//         bottomNavigationBar: _signUpText(context),
//         body: BlocListener<SignInBloc, SignInState>(
//           listener: (context, state) {
//             if (state is SignInError) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text(state.message),
//                   backgroundColor: Colors.red,
//                 ),
//               );
//             } else if (state is SignInSuccess) {
//               Navigator.pushAndRemoveUntil(
//                 context,
//                 MaterialPageRoute(builder: (context) => const RootPage()),
//                     (route) => false,
//               );
//             }
//           },
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const SizedBox(height: 40),
//                   _registerText(),
//                   const SizedBox(height: 40),
//                   _emailField(context),
//                   const SizedBox(height: 20),
//                   _passwordField(context),
//                   const SizedBox(height: 20),
//                   BlocBuilder<SignInBloc, SignInState>(
//                     builder: (context, state) {
//                       if (state is SignInLoading) {
//                         return const CircularProgressIndicator();
//                       }
//                       return BasicAppButton(
//                         title: "Sign In",
//                         onTap: () {
//                           // Trigger the SignInSubmitted event
//                           context.read<SignInBloc>().add(
//                             SignInSubmitted(
//                               email: _email.text,
//                               password: _password.text,
//                             ),
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _registerText() {
//     return const Text(
//       'Sign In',
//       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
//       textAlign: TextAlign.center,
//     );
//   }
//
//   Widget _emailField(BuildContext context) {
//     return TextField(
//       controller: _email,
//       keyboardType: TextInputType.emailAddress,
//       decoration: const InputDecoration(hintText: 'Enter user name or email')
//           .applyDefaults(Theme.of(context).inputDecorationTheme),
//     );
//   }
//
//   Widget _passwordField(BuildContext context) {
//     return TextField(
//       controller: _password,
//       obscureText: true,
//       decoration: const InputDecoration(hintText: 'Password')
//           .applyDefaults(Theme.of(context).inputDecorationTheme),
//     );
//   }
//
//   Widget _signUpText(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Text(
//             'Not a member?',
//             style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
//             textAlign: TextAlign.center,
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                     builder: (BuildContext context) => SignUpPage()),
//               );
//             },
//             child: const Text('Register Now'),
//           ),
//         ],
//       ),
//     );
//   }
// }
