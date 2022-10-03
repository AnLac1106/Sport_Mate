import 'package:flutter/material.dart';

class FadeRoute extends PageRouteBuilder {
    final Widget page;

    FadeRoute({required this.page})
            : super(
      settings: RouteSettings(name: page.runtimeType.toString()),
        pageBuilder: (
                context,
                animation,
                secondaryAnimation,
                ) =>
        page,
        transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
                ) =>
                FadeTransition(
                    opacity: animation,
                    child: child,
                ),
    );
}
