import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/const/color.dart';
import 'package:practice/main.dart';
import 'package:practice/pages/auth/signup.dart';
import 'package:practice/providers/global_state.dart';
import 'package:practice/widgets/bottomNev.dart';
import 'package:practice/widgets/customButton.dart';
import 'package:practice/widgets/customTextField.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  TextEditingController nameController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    final isLoggedIn = ref.watch(loggedInProvider);
    if(isLoggedIn) {
      return BottomNev();
    }
    return Scaffold(  
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(''),
        actions: [
          TextButton(
            onPressed: () {
             
              //material page route
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Signup()));
            },
            child: Text(
              'Sign Up',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                CustomTextField( hintText: 'Email', controller: nameController)
               , 
                   CustomTextField(hintText: 'Password', controller: nameController),
                const SizedBox(height: 16),
              
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Handle forgot password logic
                    },
                    child: const Text('Forgot Password?', style: TextStyle(color: Colors.black)),
                  ),
                ),
                const SizedBox(height: 16),
                CustomButton(title:  'Sign In', onPressed: (){ updateState(ref, loggedInProvider, !isLoggedIn);}),
                
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey[400],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'OR CONTINUE WITH',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                    ElevatedButton.icon(
                  onPressed: () {
                    // Handle Google signup logic
                  },
                  icon: Image.asset(
                    'assets/google_icon.png',  // Use your transparent Google icon
                    height: 16, // Adjust the size as needed
                  ),
                  label: const Text('Sign Up with Google'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: const BorderSide(color: primaryColor),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'By clicking continue, you agree to our Terms of Service and Privacy Policy.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
