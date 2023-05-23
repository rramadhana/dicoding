import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SubMenu extends StatelessWidget {
  const SubMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu Bangun Datar"),
      ),
      body: Container(
        margin: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30.0,
              ),
              Card(
                child: SizedBox(
                    height: 60.0,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/trapesium');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          SizedBox(
                            width: 10.0,
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Center(
                            child: Text(
                              "Trapesium",
                            ),
                          )
                        ],
                      ),
                    )),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Card(
                child: SizedBox(
                    height: 60.0,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/tabung');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          SizedBox(
                            width: 10.0,
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Center(
                            child: Text(
                              "Tabung",
                              style: TextStyle(color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
