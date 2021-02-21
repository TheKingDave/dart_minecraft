/// A manifest of all currently available Minecraft Versions. Also has latest
/// release and snapshot versions.
class VersionManifest {
  /// The latest available stable release of Minecraft: Java Edition.
  String latestRelease;

  /// The latest available beta snapshot of Minecraft: Java Edition.
  String latestSnapshot;

  /// A list of all available versions.
  List<Version> versions;

  VersionManifest._();

  /// Creates a minecraft [VersionManifest] from JSON data, containing
  /// all available [Version]s and the latest releases and snapshots.
  factory VersionManifest.fromJson(Map<String, dynamic> data) =>
      VersionManifest._()
        ..latestRelease = data['latest']['release']
        ..latestSnapshot = data['latest']['snapshot']
        ..versions = data['versions']
            .map((d) => Version.fromJson(d));
}

/// A Minecraft Version.
class Version {
  /// The Minecraft Version ID, e.g. "1.16.3"
  String id;

  /// The type of this Minecraft Version, e.g. "snapshot" or "release";
  String type;

  /// The URL to the manifest of this version. This manifest includes
  /// libraries, command line arguments and more configuration for this
  /// version.
  String url;

  /// Some time that is usually just minutes after [releaseTime].
  String time;

  /// The time this version was release at.
  String releaseTime;

  /// Some time that is usually just minutes after [releaseTime]
  /// as a DateTime object.
  DateTime get timeDateTime => DateTime.parse(time);

  /// The time this version was release at as a DateTime object.
  DateTime get releaseDateTiem => DateTime.parse(releaseTime);

  Version._();

  /// Creates a minecraft [Version] from JSON data.
  factory Version.fromJson(Map<String, dynamic> data) => Version._()
    ..id = data['id']
    ..type = data['type']
    ..url = data['url']
    ..time = data['time']
    ..releaseTime = data['releaseTime'];
}
