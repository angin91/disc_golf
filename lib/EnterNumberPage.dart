import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EnterNumberPage extends StatefulWidget {
  EnterNumberPage({Key key, this.title, this.buttonName}) : super(key: key);

  final String title;
  final String buttonName;

  @override
  _EnterNumberPageState createState() => _EnterNumberPageState();
}

class _EnterNumberPageState extends State<EnterNumberPage> {

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Container(
          padding: const EdgeInsets.all(40.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(widget.title, style: TextStyle(fontFamily: "Inter", fontSize: 15, color: Colors.grey)),
              ),
              new TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
                ],
                autofocus: true,
              ),
              SizedBox(
                height: size.height * 0.2,
              ),
              GestureDetector(
                onTap: () => _updatePar(),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: const Color(0xFF43991C),
                  ),
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.19,
                          vertical: size.height * 0.022),
                      child: Text(widget.buttonName, style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 15,
                          color: Colors.white),)
                  ),
                ),
              ),
            ],
          )),
    );
  }

  _updatePar() {
    Navigator.pop(context, controller.text);
  }


}
