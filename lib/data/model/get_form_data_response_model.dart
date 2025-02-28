class GetFormDataResponsModel {
  List<Fields>? fields;

  GetFormDataResponsModel({this.fields});

  GetFormDataResponsModel.fromJson(Map<String, dynamic> json) {
    if (json['fields'] != null) {
      fields = <Fields>[];
      json['fields'].forEach((v) {
        fields!.add(new Fields.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fields != null) {
      data['fields'] = this.fields!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Fields {
  String? label;
  String? name;
  Props? props;
  Style? style;
  String? type;

  Fields({this.label, this.name, this.props, this.style, this.type});

  Fields.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    name = json['name'];
    props = json['props'] != null ? new Props.fromJson(json['props']) : null;
    style = json['style'] != null ? new Style.fromJson(json['style']) : null;
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['name'] = this.name;
    if (this.props != null) {
      data['props'] = this.props!.toJson();
    }
    if (this.style != null) {
      data['style'] = this.style!.toJson();
    }
    data['type'] = this.type;
    return data;
  }
}

class Props {
  String? color;
  String? placeholder;
  String? size;
  String? type;
  String? max;
  String? min;
  List<Options>? options;
  int? cols;
  int? rows;
  String? accept;
  String? maxSize;
  bool? multiple;

  Props(
      {this.color,
        this.placeholder,
        this.size,
        this.type,
        this.max,
        this.min,
        this.options,
        this.cols,
        this.rows,
        this.accept,
        this.maxSize,
        this.multiple});

  Props.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    placeholder = json['placeholder'];
    size = json['size'];
    type = json['type'];
    max = json['max'];
    min = json['min'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(new Options.fromJson(v));
      });
    }
    cols = json['cols'];
    rows = json['rows'];
    accept = json['accept'];
    maxSize = json['maxSize'];
    multiple = json['multiple'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color'] = this.color;
    data['placeholder'] = this.placeholder;
    data['size'] = this.size;
    data['type'] = this.type;
    data['max'] = this.max;
    data['min'] = this.min;
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    data['cols'] = this.cols;
    data['rows'] = this.rows;
    data['accept'] = this.accept;
    data['maxSize'] = this.maxSize;
    data['multiple'] = this.multiple;
    return data;
  }
}

class Options {
  String? label;
  String? value;

  Options({this.label, this.value});

  Options.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['value'] = this.value;
    return data;
  }
}

class Style {
  String? borderRadius;
  String? margin;
  String? padding;

  Style({this.borderRadius, this.margin, this.padding});

  Style.fromJson(Map<String, dynamic> json) {
    borderRadius = json['borderRadius'];
    margin = json['margin'];
    padding = json['padding'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['borderRadius'] = this.borderRadius;
    data['margin'] = this.margin;
    data['padding'] = this.padding;
    return data;
  }
}
