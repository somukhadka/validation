import 'package:flutter/material.dart';

class Validate extends StatefulWidget {
  Validate({Key? key}) : super(key: key);

  @override
  _ValidateState createState() => _ValidateState();
}

class _ValidateState extends State<Validate> {

  TextEditingController password =TextEditingController();
  TextEditingController confirmpassword =TextEditingController();

  final GlobalKey<FormState> _formKey =GlobalKey<FormState>();
  validator(){
    if(_formKey.currentState != null && _formKey.currentState!.validate()){
      print("Sucessfully validate");
    } else{
      print('Error found');
    }
      }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.orangeAccent,
      appBar: AppBar(
        title: Text("Registration form"),
        centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                child: TextFormField(
                 textCapitalization: TextCapitalization.words,
                 decoration: InputDecoration(
                   icon: Icon(Icons.account_circle_sharp),
                   labelText: 'FullName',
                 ),
                 validator: (String? value){
                  if(value== null || value .trim().length ==0 ){
                    return "Please enter full name";
                  }
                  return null;
                } ,
                 ),
                ),
            Padding(
                  padding: EdgeInsets.all(8.0),
                child: TextFormField(
                 textCapitalization: TextCapitalization.words,
                 decoration: InputDecoration(
                   icon: Icon(Icons.email_rounded),
                   labelText: 'Email',
                 ),
                 validator: (String? value){
                  if(value== null || value .trim().length ==0 ){
                    return "Please enter email";
                  }

                  if(!RegExp
                  (r"^([a-zA-Z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+\/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?)$")
                  .hasMatch(value)){
                    return "Please enter correct one";
                  }
                  return null;
                
                },
                 ),
                ),

                Padding(
                  padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: password,
                 textCapitalization: TextCapitalization.words,
                  obscureText: true,
                 decoration: InputDecoration(
                   icon: Icon(Icons.lock_sharp),
                   labelText: 'Password',
                 ),
                 validator: (String? value){
                  if(value== null || value .trim().length ==0 ){
                    return "Please enter your password";
                  }
                   if (value.length < 5){
                    return"Password should be more than 5";
                  }
                  return null;
                } ,
                 ),
                ),
               Padding(
                  padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType:TextInputType.text,
                  controller: confirmpassword,
                 textCapitalization: TextCapitalization.words,
                  obscureText: true,
                 decoration: InputDecoration(
                   icon: Icon(Icons.lock_sharp),
                   labelText: 'Confirm Password',
                 ),
                 validator: (String? value){
                  if(value== null || value .trim().length ==0 ){
                    return "Please re-enter your password";
                  }
                  if (password.text != confirmpassword.text)
                  {
                    return"Password do not match";
                  }
                  return null;
                } ,
                 ),
                ),

                SizedBox(
                  height: 20,
                  
                ),
               
                 ElevatedButton(
                  
                  onPressed: () {
                    validator();
                  },
                 child: Text ("Register"),

            ),

              ],
            
            ),
            ),
            ),

    );
  }
}