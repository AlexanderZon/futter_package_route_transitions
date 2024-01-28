import 'package:flutter/material.dart';

/// Tipos de animaciones
enum AnimationType { normal, fadeIn }

/// Main class, [context] es el BuildContext de la aplicación en ese momento
/// [child] es el widget a navegar
/// [animation] es el tipo de animación
class RouteTransitions {
  final BuildContext context;
  final Widget child;
  final AnimationType animation;
  final Duration duration;
  final bool replacement;

  RouteTransitions({
    required this.context,
    required this.child,
    this.animation = AnimationType.normal,
    this.duration = const Duration(milliseconds: 200),
    this.replacement = false,
  }) {
    switch (animation) {
      case AnimationType.normal:
        _normalTransition();
        break;
      case AnimationType.fadeIn:
        _fadeInTransition();
        break;
    }
  }

  /// Push normal de la página
  void _pushPage(Route route) => Navigator.push(context, route);

  /// Push replacement de la página
  void _pushReplacementPage(Route route) =>
      Navigator.pushReplacement(context, route);

  /// Código de una transición normal
  void _normalTransition() {
    final route = MaterialPageRoute(builder: (_) => child);
    replacement ? _pushReplacementPage(route) : _pushPage(route);
  }

  /// Controller de la transición fadeIn
  void _fadeInTransition() {
    final route = PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOut)),
          child: child,
        );
      },
    );

    replacement ? _pushReplacementPage(route) : _pushPage(route);
  }
}
