class Item {
  OpenState? openState;
  ClosedState? closedState;
  String? ctaText;

  Item({this.openState, this.closedState, this.ctaText});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      openState: json['open_state'] != null
          ? OpenState.fromJson(json['open_state'])
          : null,
      closedState: json['closed_state'] != null
          ? ClosedState.fromJson(json['closed_state'])
          : null,
      ctaText: json['cta_text'],
    );
  }
}

class OpenState {
  OpenBody? body;

  OpenState({this.body});

  factory OpenState.fromJson(Map<String, dynamic> json) {
    return OpenState(
      body: json['body'] != null ? OpenBody.fromJson(json['body']) : null,
    );
  }
}

class OpenBody {
  String? title;
  String? subtitle;
  CardDetail? card;
  List<ItemDetail>? items;
  String? footer;

  OpenBody({this.title, this.subtitle, this.card, this.items, this.footer});

  factory OpenBody.fromJson(Map<String, dynamic> json) {
    var itemsList = <ItemDetail>[];
    if (json['items'] != null) {
      json['items'].forEach((v) {
        itemsList.add(ItemDetail.fromJson(v));
      });
    }
    return OpenBody(
      title: json['title'],
      subtitle: json['subtitle'],
      card: json['card'] != null ? CardDetail.fromJson(json['card']) : null,
      items: itemsList,
      footer: json['footer'],
    );
  }
}

class CardDetail {
  String? header;
  String? description;
  int? maxRange;
  int? minRange;

  CardDetail({this.header, this.description, this.maxRange, this.minRange});

  factory CardDetail.fromJson(Map<String, dynamic> json) {
    return CardDetail(
      header: json['header'],
      description: json['description'],
      maxRange: json['max_range'],
      minRange: json['min_range'],
    );
  }
}

class ItemDetail {
  String? emi;
  String? duration;
  String? title;
  String? subtitle;
  String? tag;

  ItemDetail({this.emi, this.duration, this.title, this.subtitle, this.tag});

  factory ItemDetail.fromJson(Map<String, dynamic> json) {
    return ItemDetail(
      emi: json['emi'],
      duration: json['duration'],
      title: json['title'],
      subtitle: json['subtitle'],
      tag: json['tag'],
    );
  }
}

class ClosedState {
  ClosedBody? body;

  ClosedState({this.body});

  factory ClosedState.fromJson(Map<String, dynamic> json) {
    return ClosedState(
      body: json['body'] != null ? ClosedBody.fromJson(json['body']) : null,
    );
  }
}

class ClosedBody {
  String? key1;
  String? key2;

  ClosedBody({this.key1, this.key2});

  factory ClosedBody.fromJson(Map<String, dynamic> json) {
    return ClosedBody(
      key1: json['key1'],
      key2: json['key2'],
    );
  }
}
