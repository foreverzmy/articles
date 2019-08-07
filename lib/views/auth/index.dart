import 'package:flutter/material.dart';
import 'package:articlest/utils/console.dart';
import '../../services/auth.dart';
import '../home/index.dart';

enum FormType {
  login,
  register,
}

class PhoneFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? '请输入手机号' : null;
  }
}

class PasswordFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? '请输入密码' : null;
  }
}

class LoginPage extends StatefulWidget {
  final VoidCallback onSignedIn;
  LoginPage({this.onSignedIn});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String _phone = '';
  String _password = '';

  // 校验并保存
  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    print('sds');
    if (validateAndSave()) {
      try {
        var res = await AuthService.login(_phone, _password);
        if (res) {
          Navigator.of(context).pushAndRemoveUntil(
              new MaterialPageRoute(builder: (context) => HomePage()),
              (route) => route == null);
        }
      } catch (e) {
        Console.error('Error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        // backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: Center(
          child: Text("登陆"),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image(
                  image: AssetImage('assets/images/login_logo.png'),
                  width: 80,
                ),
                const SizedBox(height: 16.0),
                Text(
                  'SHRINE',
                  style: Theme.of(context).textTheme.headline,
                ),
              ],
            ),
            const SizedBox(height: 100.0),
            Form(
              key: _formKey,
              // autovalidate: true, //开启自动校验
              child: Column(
                children: <Widget>[
                  PrimaryColorOverride(
                    color: Color(0xFF442B2D),
                    child: TextFormField(
                      key: Key('phone'),
                      autofocus: true,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: '手机号',
                      ),
                      validator: PhoneFieldValidator.validate,
                      onSaved: (value) => _phone = value,
                    ),
                  ),
                  PrimaryColorOverride(
                    color: Color(0xFF442B2D),
                    child: TextFormField(
                      key: Key('password'),
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: '密码',
                      ),
                      validator: PasswordFieldValidator.validate,
                      onSaved: (value) => _password = value,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15.0),
            Center(
              child: RaisedButton(
                key: Key('signIn'),
                child: const Text('登陆'),
                color: Theme.of(context).primaryColor,
                elevation: 3.0,
                shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                ),
                onPressed: validateAndSubmit,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PrimaryColorOverride extends StatelessWidget {
  const PrimaryColorOverride({Key key, this.color, this.child})
      : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: child,
      data: Theme.of(context).copyWith(primaryColor: color),
    );
  }
}
