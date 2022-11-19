import 'package:flutter/material.dart';
import 'route_animations.dart';

/// Animation Types
enum AnimationType { material, fadeIn }

/// Main class
///
/// [context] es el context de la app
/// [child] is the target navigation widget
/// [animation] the [AnimationType]
// @Deprecated("Deprecated example")
class RouteTransitions {
  final BuildContext context;
  final Widget child;
  final AnimationType animation;
  final Duration duration;
  final bool replace;

  RouteTransitions(
      {required this.context,
      required this.child,
      this.animation = AnimationType.material,
      this.duration = const Duration(milliseconds: 400),
      this.replace = false}) {
    /// Route with animation
    Route route;

    /// Animation type switcher
    switch (animation) {
      case AnimationType.material:
        route = MaterialPageRoute(builder: (_) => child);
        break;
      case AnimationType.fadeIn:
        route = FadeInRouteBuilder(child: child, duration: duration);
        break;
    }

    /// Navigation type (push or pushReplacement)
    if (replace) {
      Navigator.pushReplacement(context, route);
    } else {
      Navigator.push(context, route);
    }
  }
}
