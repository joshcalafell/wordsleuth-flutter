/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the Word type in your schema. */
@immutable
class Word extends Model {
  static const classType = const _WordModelType();
  final String id;
  final String? _text;
  final int? _a_count;
  final int? _b_count;
  final int? _c_count;
  final int? _d_count;
  final int? _e_count;
  final int? _f_count;
  final int? _g_count;
  final int? _h_count;
  final int? _i_count;
  final int? _j_count;
  final int? _k_count;
  final int? _l_count;
  final int? _m_count;
  final int? _n_count;
  final int? _o_count;
  final int? _p_count;
  final int? _q_count;
  final int? _r_count;
  final int? _s_count;
  final int? _t_count;
  final int? _u_count;
  final int? _v_count;
  final int? _w_count;
  final int? _x_count;
  final int? _y_count;
  final int? _z_count;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @Deprecated(
      '[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;

  WordModelIdentifier get modelIdentifier {
    return WordModelIdentifier(id: id);
  }

  String? get text {
    return _text;
  }

  int? get a_count {
    return _a_count;
  }

  int? get b_count {
    return _b_count;
  }

  int? get c_count {
    return _c_count;
  }

  int? get d_count {
    return _d_count;
  }

  int? get e_count {
    return _e_count;
  }

  int? get f_count {
    return _f_count;
  }

  int? get g_count {
    return _g_count;
  }

  int? get h_count {
    return _h_count;
  }

  int? get i_count {
    return _i_count;
  }

  int? get j_count {
    return _j_count;
  }

  int? get k_count {
    return _k_count;
  }

  int? get l_count {
    return _l_count;
  }

  int? get m_count {
    return _m_count;
  }

  int? get n_count {
    return _n_count;
  }

  int? get o_count {
    return _o_count;
  }

  int? get p_count {
    return _p_count;
  }

  int? get q_count {
    return _q_count;
  }

  int? get r_count {
    return _r_count;
  }

  int? get s_count {
    return _s_count;
  }

  int? get t_count {
    return _t_count;
  }

  int? get u_count {
    return _u_count;
  }

  int? get v_count {
    return _v_count;
  }

  int? get w_count {
    return _w_count;
  }

  int? get x_count {
    return _x_count;
  }

  int? get y_count {
    return _y_count;
  }

  int? get z_count {
    return _z_count;
  }

  TemporalDateTime? get createdAt {
    return _createdAt;
  }

  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  const Word._internal(
      {required this.id,
      text,
      a_count,
      b_count,
      c_count,
      d_count,
      e_count,
      f_count,
      g_count,
      h_count,
      i_count,
      j_count,
      k_count,
      l_count,
      m_count,
      n_count,
      o_count,
      p_count,
      q_count,
      r_count,
      s_count,
      t_count,
      u_count,
      v_count,
      w_count,
      x_count,
      y_count,
      z_count,
      createdAt,
      updatedAt})
      : _text = text,
        _a_count = a_count,
        _b_count = b_count,
        _c_count = c_count,
        _d_count = d_count,
        _e_count = e_count,
        _f_count = f_count,
        _g_count = g_count,
        _h_count = h_count,
        _i_count = i_count,
        _j_count = j_count,
        _k_count = k_count,
        _l_count = l_count,
        _m_count = m_count,
        _n_count = n_count,
        _o_count = o_count,
        _p_count = p_count,
        _q_count = q_count,
        _r_count = r_count,
        _s_count = s_count,
        _t_count = t_count,
        _u_count = u_count,
        _v_count = v_count,
        _w_count = w_count,
        _x_count = x_count,
        _y_count = y_count,
        _z_count = z_count,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory Word(
      {String? id,
      String? text,
      int? a_count,
      int? b_count,
      int? c_count,
      int? d_count,
      int? e_count,
      int? f_count,
      int? g_count,
      int? h_count,
      int? i_count,
      int? j_count,
      int? k_count,
      int? l_count,
      int? m_count,
      int? n_count,
      int? o_count,
      int? p_count,
      int? q_count,
      int? r_count,
      int? s_count,
      int? t_count,
      int? u_count,
      int? v_count,
      int? w_count,
      int? x_count,
      int? y_count,
      int? z_count}) {
    return Word._internal(
        id: id == null ? UUID.getUUID() : id,
        text: text,
        a_count: a_count,
        b_count: b_count,
        c_count: c_count,
        d_count: d_count,
        e_count: e_count,
        f_count: f_count,
        g_count: g_count,
        h_count: h_count,
        i_count: i_count,
        j_count: j_count,
        k_count: k_count,
        l_count: l_count,
        m_count: m_count,
        n_count: n_count,
        o_count: o_count,
        p_count: p_count,
        q_count: q_count,
        r_count: r_count,
        s_count: s_count,
        t_count: t_count,
        u_count: u_count,
        v_count: v_count,
        w_count: w_count,
        x_count: x_count,
        y_count: y_count,
        z_count: z_count);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Word &&
        id == other.id &&
        _text == other._text &&
        _a_count == other._a_count &&
        _b_count == other._b_count &&
        _c_count == other._c_count &&
        _d_count == other._d_count &&
        _e_count == other._e_count &&
        _f_count == other._f_count &&
        _g_count == other._g_count &&
        _h_count == other._h_count &&
        _i_count == other._i_count &&
        _j_count == other._j_count &&
        _k_count == other._k_count &&
        _l_count == other._l_count &&
        _m_count == other._m_count &&
        _n_count == other._n_count &&
        _o_count == other._o_count &&
        _p_count == other._p_count &&
        _q_count == other._q_count &&
        _r_count == other._r_count &&
        _s_count == other._s_count &&
        _t_count == other._t_count &&
        _u_count == other._u_count &&
        _v_count == other._v_count &&
        _w_count == other._w_count &&
        _x_count == other._x_count &&
        _y_count == other._y_count &&
        _z_count == other._z_count;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Word {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("text=" + "$_text" + ", ");
    buffer.write(
        "a_count=" + (_a_count != null ? _a_count!.toString() : "null") + ", ");
    buffer.write(
        "b_count=" + (_b_count != null ? _b_count!.toString() : "null") + ", ");
    buffer.write(
        "c_count=" + (_c_count != null ? _c_count!.toString() : "null") + ", ");
    buffer.write(
        "d_count=" + (_d_count != null ? _d_count!.toString() : "null") + ", ");
    buffer.write(
        "e_count=" + (_e_count != null ? _e_count!.toString() : "null") + ", ");
    buffer.write(
        "f_count=" + (_f_count != null ? _f_count!.toString() : "null") + ", ");
    buffer.write(
        "g_count=" + (_g_count != null ? _g_count!.toString() : "null") + ", ");
    buffer.write(
        "h_count=" + (_h_count != null ? _h_count!.toString() : "null") + ", ");
    buffer.write(
        "i_count=" + (_i_count != null ? _i_count!.toString() : "null") + ", ");
    buffer.write(
        "j_count=" + (_j_count != null ? _j_count!.toString() : "null") + ", ");
    buffer.write(
        "k_count=" + (_k_count != null ? _k_count!.toString() : "null") + ", ");
    buffer.write(
        "l_count=" + (_l_count != null ? _l_count!.toString() : "null") + ", ");
    buffer.write(
        "m_count=" + (_m_count != null ? _m_count!.toString() : "null") + ", ");
    buffer.write(
        "n_count=" + (_n_count != null ? _n_count!.toString() : "null") + ", ");
    buffer.write(
        "o_count=" + (_o_count != null ? _o_count!.toString() : "null") + ", ");
    buffer.write(
        "p_count=" + (_p_count != null ? _p_count!.toString() : "null") + ", ");
    buffer.write(
        "q_count=" + (_q_count != null ? _q_count!.toString() : "null") + ", ");
    buffer.write(
        "r_count=" + (_r_count != null ? _r_count!.toString() : "null") + ", ");
    buffer.write(
        "s_count=" + (_s_count != null ? _s_count!.toString() : "null") + ", ");
    buffer.write(
        "t_count=" + (_t_count != null ? _t_count!.toString() : "null") + ", ");
    buffer.write(
        "u_count=" + (_u_count != null ? _u_count!.toString() : "null") + ", ");
    buffer.write(
        "v_count=" + (_v_count != null ? _v_count!.toString() : "null") + ", ");
    buffer.write(
        "w_count=" + (_w_count != null ? _w_count!.toString() : "null") + ", ");
    buffer.write(
        "x_count=" + (_x_count != null ? _x_count!.toString() : "null") + ", ");
    buffer.write(
        "y_count=" + (_y_count != null ? _y_count!.toString() : "null") + ", ");
    buffer.write(
        "z_count=" + (_z_count != null ? _z_count!.toString() : "null") + ", ");
    buffer.write("createdAt=" +
        (_createdAt != null ? _createdAt!.format() : "null") +
        ", ");
    buffer.write(
        "updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  Word copyWith(
      {String? text,
      int? a_count,
      int? b_count,
      int? c_count,
      int? d_count,
      int? e_count,
      int? f_count,
      int? g_count,
      int? h_count,
      int? i_count,
      int? j_count,
      int? k_count,
      int? l_count,
      int? m_count,
      int? n_count,
      int? o_count,
      int? p_count,
      int? q_count,
      int? r_count,
      int? s_count,
      int? t_count,
      int? u_count,
      int? v_count,
      int? w_count,
      int? x_count,
      int? y_count,
      int? z_count}) {
    return Word._internal(
        id: id,
        text: text ?? this.text,
        a_count: a_count ?? this.a_count,
        b_count: b_count ?? this.b_count,
        c_count: c_count ?? this.c_count,
        d_count: d_count ?? this.d_count,
        e_count: e_count ?? this.e_count,
        f_count: f_count ?? this.f_count,
        g_count: g_count ?? this.g_count,
        h_count: h_count ?? this.h_count,
        i_count: i_count ?? this.i_count,
        j_count: j_count ?? this.j_count,
        k_count: k_count ?? this.k_count,
        l_count: l_count ?? this.l_count,
        m_count: m_count ?? this.m_count,
        n_count: n_count ?? this.n_count,
        o_count: o_count ?? this.o_count,
        p_count: p_count ?? this.p_count,
        q_count: q_count ?? this.q_count,
        r_count: r_count ?? this.r_count,
        s_count: s_count ?? this.s_count,
        t_count: t_count ?? this.t_count,
        u_count: u_count ?? this.u_count,
        v_count: v_count ?? this.v_count,
        w_count: w_count ?? this.w_count,
        x_count: x_count ?? this.x_count,
        y_count: y_count ?? this.y_count,
        z_count: z_count ?? this.z_count);
  }

  Word.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _text = json['text'],
        _a_count = (json['a_count'] as num?)?.toInt(),
        _b_count = (json['b_count'] as num?)?.toInt(),
        _c_count = (json['c_count'] as num?)?.toInt(),
        _d_count = (json['d_count'] as num?)?.toInt(),
        _e_count = (json['e_count'] as num?)?.toInt(),
        _f_count = (json['f_count'] as num?)?.toInt(),
        _g_count = (json['g_count'] as num?)?.toInt(),
        _h_count = (json['h_count'] as num?)?.toInt(),
        _i_count = (json['i_count'] as num?)?.toInt(),
        _j_count = (json['j_count'] as num?)?.toInt(),
        _k_count = (json['k_count'] as num?)?.toInt(),
        _l_count = (json['l_count'] as num?)?.toInt(),
        _m_count = (json['m_count'] as num?)?.toInt(),
        _n_count = (json['n_count'] as num?)?.toInt(),
        _o_count = (json['o_count'] as num?)?.toInt(),
        _p_count = (json['p_count'] as num?)?.toInt(),
        _q_count = (json['q_count'] as num?)?.toInt(),
        _r_count = (json['r_count'] as num?)?.toInt(),
        _s_count = (json['s_count'] as num?)?.toInt(),
        _t_count = (json['t_count'] as num?)?.toInt(),
        _u_count = (json['u_count'] as num?)?.toInt(),
        _v_count = (json['v_count'] as num?)?.toInt(),
        _w_count = (json['w_count'] as num?)?.toInt(),
        _x_count = (json['x_count'] as num?)?.toInt(),
        _y_count = (json['y_count'] as num?)?.toInt(),
        _z_count = (json['z_count'] as num?)?.toInt(),
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString(json['createdAt'])
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString(json['updatedAt'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'text': _text,
        'a_count': _a_count,
        'b_count': _b_count,
        'c_count': _c_count,
        'd_count': _d_count,
        'e_count': _e_count,
        'f_count': _f_count,
        'g_count': _g_count,
        'h_count': _h_count,
        'i_count': _i_count,
        'j_count': _j_count,
        'k_count': _k_count,
        'l_count': _l_count,
        'm_count': _m_count,
        'n_count': _n_count,
        'o_count': _o_count,
        'p_count': _p_count,
        'q_count': _q_count,
        'r_count': _r_count,
        's_count': _s_count,
        't_count': _t_count,
        'u_count': _u_count,
        'v_count': _v_count,
        'w_count': _w_count,
        'x_count': _x_count,
        'y_count': _y_count,
        'z_count': _z_count,
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  Map<String, Object?> toMap() => {
        'id': id,
        'text': _text,
        'a_count': _a_count,
        'b_count': _b_count,
        'c_count': _c_count,
        'd_count': _d_count,
        'e_count': _e_count,
        'f_count': _f_count,
        'g_count': _g_count,
        'h_count': _h_count,
        'i_count': _i_count,
        'j_count': _j_count,
        'k_count': _k_count,
        'l_count': _l_count,
        'm_count': _m_count,
        'n_count': _n_count,
        'o_count': _o_count,
        'p_count': _p_count,
        'q_count': _q_count,
        'r_count': _r_count,
        's_count': _s_count,
        't_count': _t_count,
        'u_count': _u_count,
        'v_count': _v_count,
        'w_count': _w_count,
        'x_count': _x_count,
        'y_count': _y_count,
        'z_count': _z_count,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt
      };

  static final QueryModelIdentifier<WordModelIdentifier> MODEL_IDENTIFIER =
      QueryModelIdentifier<WordModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField TEXT = QueryField(fieldName: "text");
  static final QueryField A_COUNT = QueryField(fieldName: "a_count");
  static final QueryField B_COUNT = QueryField(fieldName: "b_count");
  static final QueryField C_COUNT = QueryField(fieldName: "c_count");
  static final QueryField D_COUNT = QueryField(fieldName: "d_count");
  static final QueryField E_COUNT = QueryField(fieldName: "e_count");
  static final QueryField F_COUNT = QueryField(fieldName: "f_count");
  static final QueryField G_COUNT = QueryField(fieldName: "g_count");
  static final QueryField H_COUNT = QueryField(fieldName: "h_count");
  static final QueryField I_COUNT = QueryField(fieldName: "i_count");
  static final QueryField J_COUNT = QueryField(fieldName: "j_count");
  static final QueryField K_COUNT = QueryField(fieldName: "k_count");
  static final QueryField L_COUNT = QueryField(fieldName: "l_count");
  static final QueryField M_COUNT = QueryField(fieldName: "m_count");
  static final QueryField N_COUNT = QueryField(fieldName: "n_count");
  static final QueryField O_COUNT = QueryField(fieldName: "o_count");
  static final QueryField P_COUNT = QueryField(fieldName: "p_count");
  static final QueryField Q_COUNT = QueryField(fieldName: "q_count");
  static final QueryField R_COUNT = QueryField(fieldName: "r_count");
  static final QueryField S_COUNT = QueryField(fieldName: "s_count");
  static final QueryField T_COUNT = QueryField(fieldName: "t_count");
  static final QueryField U_COUNT = QueryField(fieldName: "u_count");
  static final QueryField V_COUNT = QueryField(fieldName: "v_count");
  static final QueryField W_COUNT = QueryField(fieldName: "w_count");
  static final QueryField X_COUNT = QueryField(fieldName: "x_count");
  static final QueryField Y_COUNT = QueryField(fieldName: "y_count");
  static final QueryField Z_COUNT = QueryField(fieldName: "z_count");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Word";
    modelSchemaDefinition.pluralName = "Words";

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Word.TEXT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Word.A_COUNT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Word.B_COUNT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Word.C_COUNT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Word.D_COUNT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Word.E_COUNT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Word.F_COUNT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Word.G_COUNT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Word.H_COUNT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Word.I_COUNT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Word.J_COUNT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Word.K_COUNT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Word.L_COUNT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Word.M_COUNT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Word.N_COUNT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Word.O_COUNT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Word.P_COUNT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Word.Q_COUNT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Word.R_COUNT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Word.S_COUNT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Word.T_COUNT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Word.U_COUNT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Word.V_COUNT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Word.W_COUNT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Word.X_COUNT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Word.Y_COUNT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Word.Z_COUNT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
        fieldName: 'createdAt',
        isRequired: false,
        isReadOnly: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
        fieldName: 'updatedAt',
        isRequired: false,
        isReadOnly: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));
  });
}

class _WordModelType extends ModelType<Word> {
  const _WordModelType();

  @override
  Word fromJson(Map<String, dynamic> jsonData) {
    return Word.fromJson(jsonData);
  }

  @override
  String modelName() {
    return 'Word';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Word] in your schema.
 */
@immutable
class WordModelIdentifier implements ModelIdentifier<Word> {
  final String id;

  /** Create an instance of WordModelIdentifier using [id] the primary key. */
  const WordModelIdentifier({required this.id});

  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{'id': id});

  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
      .entries
      .map((entry) => (<String, dynamic>{entry.key: entry.value}))
      .toList();

  @override
  String serializeAsString() => serializeAsMap().values.join('#');

  @override
  String toString() => 'WordModelIdentifier(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is WordModelIdentifier && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
