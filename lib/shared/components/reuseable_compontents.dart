import 'package:flutter/material.dart';
import 'package:medical_project_s/shared/styles/colors.dart';


class StackContainer extends StatelessWidget {
  final Color containerColor;
  final Color textColor;
  final String text;
StackContainer({@required this.containerColor,@required this.text,@required this.textColor});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width*0.28,
      height: height,
      child: Center(child: Text(text,style: TextStyle(color: textColor,fontSize: 20),),),
      decoration: BoxDecoration(color: containerColor,
        borderRadius: BorderRadius.circular(5)
      ),
    );

  }
}




class DefaultFormField extends StatelessWidget {
  final String label;
  final Function validate;
  final TextEditingController textEditingController;
  DefaultFormField({@required this.label,@required this.validate,@required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validate,
      style: TextStyle(
          color: Colors.black
      ),
      controller: textEditingController,
      decoration: InputDecoration(

          label: Text(label),
          border: OutlineInputBorder()
      ),
    );
  }
}

class DefaultTextButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  DefaultTextButton({@required this.text,@required this.onPressed, });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text.toUpperCase()),
    );
  }
}

void navigateTo(context,widget){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));
}

void navigateAndFinish(context,widget){
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context)=>widget),
          (Route <dynamic>route)=>false);
}

Widget defaultAppBar(
    {BuildContext context, List<Widget> actions, String title}) {
  return AppBar(
    actions: actions,
    title: Text(title),
    titleSpacing: 0.0,
    leading: IconButton(
      onPressed: (){Navigator.pop(context);},
      icon: Icon(Icons.arrow_back_ios),
    ),
  );
}

Widget buildTextFormField({@required bool obscure,@required String label}){

  return  Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(

      cursorColor:backDarkFourColor ,
      cursorWidth: 2,
      cursorHeight: 25,
      obscureText:obscure ,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
          labelText: label,
          labelStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 16),
/*
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              width: 0,
              color: Colors.white,
            ),
          ),

 */
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color:
              backDarkOneColor
              )
          )
      ),
    ),
  );
}






