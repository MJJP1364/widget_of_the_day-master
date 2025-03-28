import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

class MyForm extends StatelessWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello Javad'),
        ),
        body: const SafeArea(child: MyPage()),
      ),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController textControler = TextEditingController();
  String text = '';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextFormField(
                // enabled: false,
                // readOnly: true,
                // autofocus: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'you cant Enter Empty Email';
                  }
                  if (!RegExp(
                          r"^([A-Z|a-z|0-9](\.|_){0,1})+[A-Z|a-z|0-9]\@([A-Z|a-z|0-9])+((\.){0,1}[A-Z|a-z|0-9]){2}\.[a-z]{2,3}$")
                      .hasMatch(value)) {
                    return 'Please Enter Valid Email Address';
                  }

                  if (value.length <= 2) {
                    return 'you cant Enter Less than 2 char';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  label: Text('Email'),
                  helperText: 'Helper1',
                  hintText: 'EMAIL',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.elliptical(30, 30),
                      bottomRight: Radius.elliptical(30, 30),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                // keyboardType: TextInputType.number,
                // keyboardAppearance: Brightness.dark,
                obscureText: true,
                obscuringCharacter: '#',
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'you cant Enter Empty Password';
                  }

                  if (!RegExp(
                          r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$")
                      .hasMatch(value)) {
                    return 'Please Enter Valid Password';
                  }
                  if (value.length <= 2) {
                    return 'you cant Enter Less than 2 char';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  label: Text('Password'),
                  helperText: 'Helper2',
                  hintText: 'Pssword',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.elliptical(30, 30),
                      bottomRight: Radius.elliptical(30, 30),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _formKey.currentState!.validate()
                          ? ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('this is valid'),
                              ),
                            )
                          : ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('this is not valid'),
                              ),
                            );
                    },
                    child: const Text('Submit'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _formKey.currentState!.reset();
                    },
                    child: const Text('Reset'),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              TextField(
                // inputFormatters: [
                //   FilteringTextInputFormatter.allow(
                //     RegExp("[a-z]+"),
                //   ),
                // ],
                controller: textControler,
                decoration: const InputDecoration(
                  icon: Icon(Icons.access_alarm),
                  prefixIcon: Icon(Icons.access_alarm),
                  suffixIcon: Icon(Icons.access_alarm),
                  labelText: 'Lable',
                  // label: Text('Text Filed'),
                  helperText: 'Helper3',
                  hintText: 'Text Filed',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.elliptical(30, 30),
                      bottomRight: Radius.elliptical(30, 30),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    text = textControler.text;
                  });
                },
                child: const Text('Show Text'),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
