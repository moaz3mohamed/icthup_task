import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class settingscreen extends StatefulWidget {
  const settingscreen({super.key});

  @override
  State<settingscreen> createState() => _settingscreenState();
}

// ignore: camel_case_types
class _settingscreenState extends State<settingscreen> {
  var formkey = GlobalKey<FormState>();

  int resultsum = 0;

  TextEditingController? number1controller = TextEditingController();

  TextEditingController? number2controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$resultsum', style: TextStyle(fontSize: 30)),
                TextFormField(
                  controller: number1controller,
                  // ignore: body_might_complete_normally_nullable
                  validator: (value) {
                    int? result = int.tryParse(value ?? '');

                    // ignore: unrelated_type_equality_checks
                    if (result! > 10) {
                      return 'empty';
                    }
                    return null;
                  },

                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hint: Text('number1', style: TextStyle(color: Colors.blue)),
                    label: Text('number1'),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black, width: 4),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.green, width: 4),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.red, width: 4),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.red, width: 4),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                TextFormField(
                  controller: number2controller,
                  validator: (value) {
                    int? result = int.tryParse(value ?? '');

                    // ignore: unrelated_type_equality_checks
                    if (result == null || result == '') {
                      return 'empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'number2',
                    hintStyle: TextStyle(color: Colors.blue),
                    label: Text('number2'),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black, width: 4),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.green, width: 4),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.red, width: 4),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.red, width: 4),
                    ),
                  ),
                ),
                SizedBox(height: 100),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (formkey.currentState!.validate()) {
                        int n1 = int.parse(number1controller!.text);
                        int n2 = int.parse(number2controller!.text);
                        resultsum = n1 + n2;
                      }
                    });
                  },
                  child: Text('sum'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
