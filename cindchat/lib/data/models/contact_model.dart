import 'dart:convert';

import 'package:cindchat/domain/entities/contact.dart';
import 'package:equatable/equatable.dart';

class ContactModel extends Equatable {
  String? name;
  String? image;
  String? phoneNumber;

  ContactModel({
    this.name,
    this.image,
    this.phoneNumber,
  });

  ContactModel copyWith({
    String? name,
    String? image,
    String? phoneNumber,
  }) {
    return ContactModel(
      name: name ?? this.name,
      image: image ?? this.image,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'phoneNumber': phoneNumber,
    };
  }

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
      name: map['name'],
      image: map['image'],
      phoneNumber: map['phoneNumber'],
    );
  }

  String toJson() => json.encode(toMap());

  Contact toEntity() =>
      Contact(name: name, image: image, phoneNumber: phoneNumber);

  factory ContactModel.fromJson(String source) =>
      ContactModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ContactModel(name: $name, image: $image, phoneNumber: $phoneNumber)';

  @override
  List<Object?> get props => [name, image, phoneNumber];
}
