
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_demo/resources/auth_methods.dart';
import 'package:instagram_demo/utils/colors.dart';
import 'package:instagram_demo/utils/utils.dart';
import 'package:instagram_demo/widgets/text-field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isloading = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
  void LoginUser()async{
    setState(() {
      _isloading=true;
    });
    String res = await AuthMethods().Login(email: _emailController.text, password: _passwordController.text);
    if(res=='success'){

    }else{
      showSnackBar(context,res);
    }
    setState(() {
      _isloading==false;
    });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Container(),flex: 2,),
              SvgPicture.asset("assets/ic_instagram.svg", color: primaryColor, height:  64,),
              const SizedBox(
                height: 30,
              ),
              ReuseableTextfield(
                textEditingController: _emailController,
                isPasswordType: false,
                hintText: 'Enter your email address',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 24,
              ),
              ReuseableTextfield(
                textEditingController: _passwordController,
                isPasswordType: true,
                hintText: 'Enter your password',
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                  height: 24,
              ),
              InkWell(
                  child: ReuseableContainer("Log In")),
              const SizedBox(
                height: 12,
              ),
              Flexible(child: Container(),flex: 2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text("Don't have an account?"),
                    padding: EdgeInsets.symmetric(vertical: 8),
                  ),
                  GestureDetector (
                    onTap: LoginUser,
                    child: Center(
                      child: Container(
                        child: _isloading? const Center(
                          child: CircularProgressIndicator(color: primaryColor,),
                        ):
                        Text("Sign up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold),),
                        padding: EdgeInsets.symmetric(vertical: 8),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
