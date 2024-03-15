import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class PageModel extends Equatable {
  final String route;
  final Widget page;

  const PageModel({required this.route, required this.page});

  @override
  List<Object?> get props => [route, page];
}
