import 'package:flutter/material.dart';
import 'package:flutter_tutorials/ui/route/route_generator.dart';
import 'package:flutter_tutorials/ui/views/home_view/home_view.dart';
import 'package:flutter_tutorials/ui/views/widgets/text_fields.dart';

class SignUpView extends StatefulWidget {
  final String referrarCode;
  SignUpView({Key key, this.referrarCode}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController referralCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    referralCodeController.text = widget.referrarCode ?? '';
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 400,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextField(
                title: 'Email',
              ),
              SizedBox(height: 10),
              AppTextField(
                title: 'Password',
              ),
              SizedBox(height: 10),
              AppTextField(
                title: 'ReferralCode',
                controller: referralCodeController,
              ),
              SizedBox(height: 10),
              RaisedButton(
                child: Text('SignUp'),
                onPressed: () {
                  GeneratedRoute.navigateTo(HomeView.routeName);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
