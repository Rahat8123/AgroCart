import 'package:flutter/cupertino.dart';

import 'curved_widgeds.dart';

class curvewidget extends StatelessWidget {
  const curvewidget({
    super.key,this.child,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper:TCustomCurvedEdges() ,
      child:child,
    );
  }
}