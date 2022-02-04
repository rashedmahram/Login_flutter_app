import 'package:demo_app/constans.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: whiteColor,
        // resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                // height: MediaQuery.of(context).viewInsets.bottom>0?0:MediaQuery.of(context).viewInsets.bottom*0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(50),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    LogoWidget(),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius:  BorderRadius.vertical(
                          bottom: Radius.circular(50),
                        ),
                      ),
                      child: TabBar(
                        labelColor: Colors.black,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelStyle: Theme.of(context).textTheme.headline6,
                        unselectedLabelStyle:
                            Theme.of(context).textTheme.bodyText2,
                        indicatorColor: yellowColor,
                        indicatorWeight: 3,
                        tabs: [loginTabar(), signUpTabar()],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Form(
                  child: Column(
                    children: [
                      Spacer(
                        flex: 6,
                      ),
                      InputEmail(),
                      InputPassword(),
                      Spacer(
                        flex: 1,
                      ),
                      forgetPass(),
                      Spacer(
                        flex: 6,
                      ),
                      loginButton(context),
                      signUpButton(),
                      Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Tab signUpTabar() {
    return Tab(
      text: "  SignUp  ",
    );
  }

  Tab loginTabar() {
    return Tab(
      text: "    Login    ",
    );
  }

  Wrap signUpButton() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text("Don't Have Acount?"),
        FlatButton(
          onPressed: () {},
          child: Text("SingUp."),
        ),
      ],
    );
  }

  RaisedButton loginButton(BuildContext context) {
    return RaisedButton(
      onPressed: () {},
      padding: EdgeInsets.all(12),
      shape: StadiumBorder(),
      child: Center(
          child: Text(
        "Enter To App",
        style: Theme.of(context).textTheme.headline6,
      )),
      color: yellowColor,
    );
  }

  Align forgetPass() {
    return Align(
      alignment: Alignment.centerRight,
      child: Text("Forget Password ?"),
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Icon(Icons.home),
    );
  }
}

class InputPassword extends StatelessWidget {
  const InputPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Password",
        suffix: Icon(Icons.visibility),
        icon: Container(
          decoration: BoxDecoration(
              color: yellowColor, borderRadius: BorderRadius.circular(12)),
          padding: EdgeInsets.all(7),
          child: Icon(
            Icons.password_rounded,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class InputEmail extends StatelessWidget {
  const InputEmail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) =>
          value!.isEmpty ? null : value = "This field required",
      decoration: InputDecoration(
        hintText: "Email",
        icon: Container(
          decoration: BoxDecoration(
              color: yellowColor, borderRadius: BorderRadius.circular(12)),
          padding: EdgeInsets.all(7),
          child: Icon(
            Icons.email,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
