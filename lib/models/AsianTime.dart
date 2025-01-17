/// abbreviation : "IST"
/// client_ip : "2405:201:a404:d952:9987:82d8:2c32:b5b5"
/// datetime : "2024-04-15T10:40:28.542628+05:30"
/// day_of_week : 1
/// day_of_year : 106
/// dst : false
/// dst_from : null
/// dst_offset : 0
/// dst_until : null
/// raw_offset : 19800
/// timezone : "Asia/Kolkata"
/// unixtime : 1713157828
/// utc_datetime : "2024-04-15T05:10:28.542628+00:00"
/// utc_offset : "+05:30"
/// week_number : 16

class AsianTime {
  AsianTime({
      String? abbreviation, 
      String? clientIp, 
      String? datetime, 
      num? dayOfWeek, 
      num? dayOfYear, 
      bool? dst, 
      dynamic dstFrom, 
      num? dstOffset, 
      dynamic dstUntil, 
      num? rawOffset, 
      String? timezone, 
      num? unixtime, 
      String? utcDatetime, 
      String? utcOffset, 
      num? weekNumber,}){
    _abbreviation = abbreviation;
    _clientIp = clientIp;
    _datetime = datetime;
    _dayOfWeek = dayOfWeek;
    _dayOfYear = dayOfYear;
    _dst = dst;
    _dstFrom = dstFrom;
    _dstOffset = dstOffset;
    _dstUntil = dstUntil;
    _rawOffset = rawOffset;
    _timezone = timezone;
    _unixtime = unixtime;
    _utcDatetime = utcDatetime;
    _utcOffset = utcOffset;
    _weekNumber = weekNumber;
}

  AsianTime.fromJson(dynamic json) {
    _abbreviation = json['abbreviation'];
    _clientIp = json['client_ip'];
    _datetime = json['datetime'];
    _dayOfWeek = json['day_of_week'];
    _dayOfYear = json['day_of_year'];
    _dst = json['dst'];
    _dstFrom = json['dst_from'];
    _dstOffset = json['dst_offset'];
    _dstUntil = json['dst_until'];
    _rawOffset = json['raw_offset'];
    _timezone = json['timezone'];
    _unixtime = json['unixtime'];
    _utcDatetime = json['utc_datetime'];
    _utcOffset = json['utc_offset'];
    _weekNumber = json['week_number'];
  }
  String? _abbreviation;
  String? _clientIp;
  String? _datetime;
  num? _dayOfWeek;
  num? _dayOfYear;
  bool? _dst;
  dynamic _dstFrom;
  num? _dstOffset;
  dynamic _dstUntil;
  num? _rawOffset;
  String? _timezone;
  num? _unixtime;
  String? _utcDatetime;
  String? _utcOffset;
  num? _weekNumber;
AsianTime copyWith({  String? abbreviation,
  String? clientIp,
  String? datetime,
  num? dayOfWeek,
  num? dayOfYear,
  bool? dst,
  dynamic dstFrom,
  num? dstOffset,
  dynamic dstUntil,
  num? rawOffset,
  String? timezone,
  num? unixtime,
  String? utcDatetime,
  String? utcOffset,
  num? weekNumber,
}) => AsianTime(  abbreviation: abbreviation ?? _abbreviation,
  clientIp: clientIp ?? _clientIp,
  datetime: datetime ?? _datetime,
  dayOfWeek: dayOfWeek ?? _dayOfWeek,
  dayOfYear: dayOfYear ?? _dayOfYear,
  dst: dst ?? _dst,
  dstFrom: dstFrom ?? _dstFrom,
  dstOffset: dstOffset ?? _dstOffset,
  dstUntil: dstUntil ?? _dstUntil,
  rawOffset: rawOffset ?? _rawOffset,
  timezone: timezone ?? _timezone,
  unixtime: unixtime ?? _unixtime,
  utcDatetime: utcDatetime ?? _utcDatetime,
  utcOffset: utcOffset ?? _utcOffset,
  weekNumber: weekNumber ?? _weekNumber,
);
  String? get abbreviation => _abbreviation;
  String? get clientIp => _clientIp;
  String? get datetime => _datetime;
  num? get dayOfWeek => _dayOfWeek;
  num? get dayOfYear => _dayOfYear;
  bool? get dst => _dst;
  dynamic get dstFrom => _dstFrom;
  num? get dstOffset => _dstOffset;
  dynamic get dstUntil => _dstUntil;
  num? get rawOffset => _rawOffset;
  String? get timezone => _timezone;
  num? get unixtime => _unixtime;
  String? get utcDatetime => _utcDatetime;
  String? get utcOffset => _utcOffset;
  num? get weekNumber => _weekNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['abbreviation'] = _abbreviation;
    map['client_ip'] = _clientIp;
    map['datetime'] = _datetime;
    map['day_of_week'] = _dayOfWeek;
    map['day_of_year'] = _dayOfYear;
    map['dst'] = _dst;
    map['dst_from'] = _dstFrom;
    map['dst_offset'] = _dstOffset;
    map['dst_until'] = _dstUntil;
    map['raw_offset'] = _rawOffset;
    map['timezone'] = _timezone;
    map['unixtime'] = _unixtime;
    map['utc_datetime'] = _utcDatetime;
    map['utc_offset'] = _utcOffset;
    map['week_number'] = _weekNumber;
    return map;
  }

}