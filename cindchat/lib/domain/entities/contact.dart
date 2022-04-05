import 'dart:convert';

import 'package:cindchat/data/models/contact_model.dart';
import 'package:equatable/equatable.dart';

class Contact extends Equatable {
  String? name;
  String? image;
  String? phoneNumber;

  Contact({
    this.name,
    this.image,
    this.phoneNumber,
  });

  Contact copyWith({
    String? name,
    String? image,
    String? phoneNumber,
  }) {
    return Contact(
      name: name ?? this.name,
      image: image ?? this.image,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  ContactModel toModel() =>
      ContactModel(name: name, image: image, phoneNumber: phoneNumber);

  @override
  List<Object?> get props => [name, image, phoneNumber];
}
