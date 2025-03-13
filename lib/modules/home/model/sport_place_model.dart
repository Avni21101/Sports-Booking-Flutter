library;

/// id : 5
/// place_name : "EKA Arena"
/// location : {"latitude":23.0225,"longitude":72.6006}
/// address : {"street":"Opp. Gate No 3, Kankaria Lake","city":"Ahmedabad","state":"Gujarat"}
/// distance : "6 km"
/// sports_list : ["Football","Cricket","Hockey"]
/// rating : 5
/// reviews_count : 270
/// open_close_timing : "7 AM - 10 PM"
/// price_range : "₹200 - ₹600"
/// facilities : {"parking":"Free","food_and_beverages":true,"equipment_rental":true}
/// slots_available : 20
/// image_url : "https://yappe.in/eka_arena.jpg"
/// offers : "Free drinks on weekends"
/// liked_by_user : false
/// contact : {"phone":"+91 9876543212"}
/// tags : ["Outdoor","Professional"]

class SportPlaceModel {
  SportPlaceModel({
    this.id,
    this.placeName,
    this.location,
    this.address,
    this.distance,
    this.sportsList,
    this.rating,
    this.reviewsCount,
    this.openCloseTiming,
    this.priceRange,
    this.facilities,
    this.slotsAvailable,
    this.imageUrl,
    this.offers,
    this.likedByUser,
    this.contact,
    this.tags,
  });

  SportPlaceModel.fromJson(dynamic json) {
    id = json['id'];
    placeName = json['place_name'];
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
    distance = json['distance'];
    sportsList = json['sports_list'] != null ? json['sports_list'].cast<String>() : [];
    rating = json['rating'];
    reviewsCount = json['reviews_count'];
    openCloseTiming = json['open_close_timing'];
    priceRange = json['price_range'];
    facilities = json['facilities'] != null ? Facilities.fromJson(json['facilities']) : null;
    slotsAvailable = json['slots_available'];
    imageUrl = json['image_url'];
    offers = json['offers'];
    likedByUser = json['liked_by_user'];
    contact = json['contact'] != null ? Contact.fromJson(json['contact']) : null;
    tags = json['tags'] != null ? json['tags'].cast<String>() : [];
  }
  int? id;
  String? placeName;
  Location? location;
  Address? address;
  String? distance;
  List<String>? sportsList;
  int? rating;
  int? reviewsCount;
  String? openCloseTiming;
  String? priceRange;
  Facilities? facilities;
  int? slotsAvailable;
  String? imageUrl;
  String? offers;
  bool? likedByUser;
  Contact? contact;
  List<String>? tags;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['place_name'] = placeName;
    if (location != null) {
      map['location'] = location?.toJson();
    }
    if (address != null) {
      map['address'] = address?.toJson();
    }
    map['distance'] = distance;
    map['sports_list'] = sportsList;
    map['rating'] = rating;
    map['reviews_count'] = reviewsCount;
    map['open_close_timing'] = openCloseTiming;
    map['price_range'] = priceRange;
    if (facilities != null) {
      map['facilities'] = facilities?.toJson();
    }
    map['slots_available'] = slotsAvailable;
    map['image_url'] = imageUrl;
    map['offers'] = offers;
    map['liked_by_user'] = likedByUser;
    if (contact != null) {
      map['contact'] = contact?.toJson();
    }
    map['tags'] = tags;
    return map;
  }
}

/// phone : "+91 9876543212"

class Contact {
  Contact({this.phone});

  Contact.fromJson(dynamic json) {
    phone = json['phone'];
  }
  String? phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = phone;
    return map;
  }
}

/// parking : "Free"
/// food_and_beverages : true
/// equipment_rental : true

class Facilities {
  Facilities({this.parking, this.foodAndBeverages, this.equipmentRental});

  Facilities.fromJson(dynamic json) {
    parking = json['parking'];
    foodAndBeverages = json['food_and_beverages'];
    equipmentRental = json['equipment_rental'];
  }
  String? parking;
  bool? foodAndBeverages;
  bool? equipmentRental;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['parking'] = parking;
    map['food_and_beverages'] = foodAndBeverages;
    map['equipment_rental'] = equipmentRental;
    return map;
  }
}

/// street : "Opp. Gate No 3, Kankaria Lake"
/// city : "Ahmedabad"
/// state : "Gujarat"

class Address {
  Address({this.street, this.city, this.state});

  Address.fromJson(dynamic json) {
    street = json['street'];
    city = json['city'];
    state = json['state'];
  }
  String? street;
  String? city;
  String? state;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['street'] = street;
    map['city'] = city;
    map['state'] = state;
    return map;
  }
}

/// latitude : 23.0225
/// longitude : 72.6006

class Location {
  Location({this.latitude, this.longitude});

  Location.fromJson(dynamic json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
  double? latitude;
  double? longitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    return map;
  }
}
