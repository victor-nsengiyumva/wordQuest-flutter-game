import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wordquest/src/features/utils/constants.dart';

class MainButton extends StatefulWidget {
  final String text;
  final VoidCallback onpressed;
  final bool disabled;
  const MainButton({
    super.key,
    required this.text,
    required this.onpressed,
    this.disabled = false,
  });

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.disabled ? null : widget.onpressed,
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 2,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: widget.disabled
                    ? const Color.fromARGB(255, 8, 33, 99)
                    : Constants.primaryColor),
            height: 50,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: widget.disabled
                      ? const CupertinoActivityIndicator(
                          // strokeWidth: 3,
                          color: Colors.white,
                        )
                      : Text(
                          widget.text,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        )),
            )),
      ),
    );
  }
}
