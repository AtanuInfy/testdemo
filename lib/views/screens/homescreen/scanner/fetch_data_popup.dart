import 'dart:async';
import 'package:ItemOptix/views/style/app_styles.dart';
import 'package:ItemOptix/views/style/colors.dart';
import 'package:ItemOptix/views/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;
import 'RFID_popup.dart';


class FetchDataPopup extends StatefulWidget {
  const FetchDataPopup({Key? key}) : super(key: key);

  @override
  State<FetchDataPopup> createState() => _FetchDataPopupState();
}

class _FetchDataPopupState extends State<FetchDataPopup> with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 2))
        ..repeat();

  Timer? _timer;
  int _start = 5;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return RFIDPopup();
              },
            );
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.clearListeners();
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      backgroundColor: colorTransparent,
      actions: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 32),
                child: Container(
                  decoration: decoration.copyWith(
                    color: colorWhite,
                  ),
                  height: 232,
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                            child: Text(
                          "Please wait, while we \n launch the App ...",
                          style: typoBold16,
                        )),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: colorSecondBlue,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8)),
                        ),
                        height: 60,
                        child: Center(
                          child: Text(
                            'Tip: pull the Trigger on your RFID \n Hand hold Reader to connect it',
                            style: typoBold14.copyWith(color: colorWhite),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 16,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black54,
                                    blurRadius: 15.0,
                                    offset: Offset(3,3)
                                )
                              ],
                              color: colorSecondBlue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32))),
                          width: 65,
                          height: 65,
                          child: AnimatedBuilder(
                            animation: _controller,
                            builder: (_, child) {
                              return Transform.rotate(
                                angle: _controller.value * 4 * math.pi,
                                child: child,
                              );
                            },
                            child:
                                SvgPicture.asset('assets/svg/homescreen/android/round_arrow.svg'),
                          )),
                    ],
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
