import 'package:flutter/material.dart';

/// Main classes
/// 
/// [child] target child of navigation
/// [duration] duration of transition
class FadeInRouteBuilder extends PageRouteBuilder {
  final Widget child;
  final Duration duration;

  FadeInRouteBuilder({
    required this.child,
    required this.duration
  }) : super(
    transitionDuration: duration,
    reverseTransitionDuration: duration,
    pageBuilder: (context, animation, secondaryAnimation) => child,
  );

  /// overrides the defatulr route transition to fade in transition
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: CurvedAnimation(parent: animation, curve: Curves.easeIn),
      child: child,
    );
  }
}