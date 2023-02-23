import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

const KPrimaryColor = Color(0XFF003E7E);
const KBackgroundColor = Color(0xFF90CAF9);

final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

Logger logger = Logger();

const String googleAPIKey = 'AIzaSyA9m0QQPAvME0J2VxFb3B8bo6GU3nViunE';
