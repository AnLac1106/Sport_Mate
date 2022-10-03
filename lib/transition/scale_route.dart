import 'package:flutter/material.dart';

class ScaleRoute extends PageRouteBuilder {
    final Widget page;

    ScaleRoute({required this.page})
            : super(
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
                ScaleTransition(
                    scale: Tween<double>(
                        begin: 0,
                        end: 1,
                    ).animate(
                        CurvedAnimation(
                            parent: animation,
                            curve: Curves.fastOutSlowIn,
                        ),
                    ),
                    child: child,
                ),
    );
}
