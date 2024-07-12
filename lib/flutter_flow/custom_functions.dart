import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

String? youtubeURLWeb(String? url) {
  // extract ID from youtube video url
  if (url == null) {
    return null;
  }

  final regExp = RegExp(
    r'^https?:\/\/(?:www\.)?youtube\.com\/watch\?v=([a-zA-Z0-9_-]{11})',
  );

  final match = regExp.firstMatch(url);

  if (match != null && match.groupCount >= 1) {
    return match.group(1);
  }

  return null;
}

String? shortUrl(String url) {
  // Regular expression to match YouTube video ID
  RegExp regExp = RegExp(
    r'^https?:\/\/(?:www\.)?youtu\.be\/([a-zA-Z0-9_-]+).*',
    caseSensitive: false,
    multiLine: false,
  );

  // Match the URL against the regular expression
  Match? match = regExp.firstMatch(url);

  // If a match is found, return the video ID, otherwise return null
  return match != null ? match.group(1) : null;
}
