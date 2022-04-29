import 'package:flutter/material.dart';
import 'package:medical_project_s/modules/sign_up_screen.dart';
import 'package:medical_project_s/shared/components/reuseable_compontents.dart';
import 'package:medical_project_s/shared/styles/colors.dart';
enum Status{Patient,Doctor}
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key key}) : super(key: key);
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  Status status=Status.Patient;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextEditingController userNameController=TextEditingController();
    return Scaffold(
      body:
      Container(
        height: height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/patient.png'), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 15),
                height: height * 0.25,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/patientLogo.png'))),
              ),
              Container(
                height: height * 0.67,
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Positioned(
                        child: Container(

                      height: height * 0.635,
                      margin: EdgeInsets.only(left: 15,right: 15),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(
                          blurRadius: 20,
                          color: backDarkThreeColor,
                          spreadRadius: 1
                            ,
                         offset: Offset(0,0)
                        )],
                        border: Border.all(width: 2,style: BorderStyle.solid,color: backDarkThreeColor)
                      ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildTextFormField(obscure: false,label: 'User Name'),
                              buildTextFormField(obscure: true,label: 'Password'),
                              SizedBox(height: 30,),
                              Container(
                                width: width*0.8,
                                height: height*0.075,
                                child: Center(child: Text('Sign In',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),),),
                                decoration: BoxDecoration(color: blueColor,
                                    borderRadius: BorderRadius.circular(20)
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Don\'t have an account ? ',style: TextStyle(
                                    color: Colors.white,

                                  )),
                                  TextButton(onPressed: (){
                                    navigateTo(context, SingUpScreen());
                                  }, child: Text('CREATE account',style: TextStyle(
                                    color: Colors.white,

                                  ),))
                                ],
                              )
                            ],
                          ),
                    )
                    ),
                    Positioned(
                        child: Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Container(
                        height: height * 0.07,
                        width: width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: (){
                                setState(() {
                             status=Status.Patient;
                                });
                              },
                              child: StackContainer(
                                containerColor:status==Status.Patient?blueColor:Colors.white,
                                text: 'Patient',
                                textColor: status==Status.Patient?Colors.white:blueColor,),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  status=Status.Doctor;
                                });
                              },
                              child: StackContainer(
                                  containerColor:status==Status.Doctor?blueColor:Colors.white,
                                text: 'Doctor',
                                textColor:status==Status.Doctor?Colors.white:blueColor,),
                            ),
                          ],
                        ),
                      ),
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
