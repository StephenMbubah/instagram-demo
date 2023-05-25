
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_demo/resources/auth_methods.dart';
import 'package:instagram_demo/utils/colors.dart';
import 'package:instagram_demo/utils/utils.dart';
import 'package:instagram_demo/widgets/text-field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  void selectImage()async{
   Uint8List _img= await pickImage(ImageSource.gallery);
   setState(() {
     _image= _img;
   });
  }
   void signUpUser()async{
     setState(() {
       _isLoading= true;
     });
     String res = await AuthMethods().signUpUser(
       email: _emailController.text,
       password: _passwordController.text,
       username: _usernameController.text,
       bio: _bioController.text,
       file: _image!,
     );
     setState(() {
       _isLoading= false;
     });
     res !='success'?showSnackBar(context, res): null;
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
              Stack(
                children: [
                  _image!=null? CircleAvatar(
                    radius: 64,
                    backgroundImage: MemoryImage(_image!)
                  )
                  :CircleAvatar(
                    radius: 64,
                    //remember to change the network image to default profile picture
                    backgroundImage: NetworkImage("data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAKYApwMBIgACEQEDEQH/xAAbAAEBAQEBAQEBAAAAAAAAAAAAAQUEBgMCB//EADkQAQABAgQCBAsGBwAAAAAAAAABAgMEBRExIUESIlFhEyMyNFJxcoHB0eEUFTNCQ5FTYpKToaKx/8QAFgEBAQEAAAAAAAAAAAAAAAAAAAEC/8QAFhEBAQEAAAAAAAAAAAAAAAAAAAER/9oADAMBAAIRAxEAPwD+toCoAAAAAAAAAAAAAAAAAAsbiRuoIAAAAAAAAAAAAAAAAAAABG6pG6ggAAAAAAM/NMf9njwNqYm5McZ9H6g++LxtnC8K56VfoU7/AEZl3OL9U6W6aaI741lnTOszMzMzPGZmSVHX95Yv+L/rD7Ws4v0fi0UVx2xGks4B6TCY2zivIq0r50Tv9XS8lEzExNPCY205N7LMf9ojwd3SLtO0+lHzB3gIAAAAEbqkbqCAAAAAA+WJuxYw9y7V+WNdO2XmLldVy5VXXOtVU6y2M+uTFm1b18qdZ9zFWFABAAB+7ddVuumuidKqZ1h+FB6mxdi/Zou07VRrpHJ9GZkVyZsXbevk1RMeqWmigAAAEbqkbqCAAAAAAxc+nx9qOXQ+LLa+fUT4m5y40shUAAAAFRYUamQ/i3fZhssjIaeF6vlrFLXZUAAAAjdUjdQQAAAAAHNmNicRhK6aY68dan1w829aw83wXga5v26fF1T1tPyyQZoCoAoIqe9p5TgpuVxfux1KZ6sTzn5A08vsTh8JRRVHW8qr1y6ARQAAACN1SN1BAAAAAAEmIqjSY1id+8qmminWuqIjtng472Z4W1wiua57KI1IObGZRx6eFmOP6dXwll3bNy1Olyiqme+GnXnU/pYf+qp8as4xE7UWqY7NJUZ2sdr62rN27V0bduqqZ7IdH3lfidYos/24fSjOMTEadC1Pu0EffB5TETFWK0nn0I+MtbaIiIiIjaIZFGdcdLtjTvpqddnMsLc4Tc6E/wA/AV2BExMa09aO2J4CAAAABG6pG6ggAAPnfvUWLU3Lk6Ux/kH7qmKaZqmYinnM8mXis3pjq4anWfTnb9nDjcbcxdXHhbjyaPm5VH7vX7l+rpXa6qp754PmAgACiACoKPtZxN3DzrZuVUz2cp9zVwmbW69KcTEUVelyliiD1u8axpMcpgedwGPuYWqKZ61rnTrt3w9BauU3bdNy3OtNW0mK/QCBG6pG6ggAJM9GJqmYiIjWZeczDFzir2sTpbp4Ux8WnnV+bWHi3TPG5v6oYawBAQAAAAAAAAAA56u7LMZ9nu9CqfFV7909rhAetVxZTf8ADYSIq8q3PRn4O1FI3VI3UEABg51XNWM0naiiIj/rgducee1+qHE0gAgAAAAAAAAAAAKNLI6/H3LfKadf2bbByTzyr2Jb0bJSEbqkbqioADz+c+fT6ocINIAIAAAAAAAAAAACjQyTzyfYlvcgSkI3UEV//9k="),
                  ),
                  Positioned(
                    bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: selectImage,
                        icon: Icon(Icons.add_a_photo),
                      )),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              ReuseableTextfield(
                textEditingController: _usernameController,
                isPasswordType: false,
                hintText: 'Enter your username',
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 24,
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
              ReuseableTextfield(
                textEditingController: _bioController,
                isPasswordType: false,
                hintText: 'Enter your bio',
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                  child: ReuseableContainer("Sign Up")),
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
                  InkWell (
                    onTap: signUpUser,
                    child: _isLoading?const Center(
                      child: CircularProgressIndicator(color: primaryColor,),
                    ): Center(
                      child: Container(
                        child: Text("Sign up",
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

