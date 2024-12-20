//
// Copyright 2024 Toyota Connected North America
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// Autogenerated from Pigeon (v22.6.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import, no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

PlatformException _createConnectionError(String channelName) {
  return PlatformException(
    code: 'channel-error',
    message: 'Unable to establish connection on channel: "$channelName".',
  );
}

List<Object?> wrapResponse({Object? result, PlatformException? error, bool empty = false}) {
  if (empty) {
    return <Object?>[];
  }
  if (error == null) {
    return <Object?>[result];
  }
  return <Object?>[error.code, error.message, error.details];
}

class Remote {
  Remote({
    required this.name,
    required this.url,
    required this.collectionId,
    required this.title,
    required this.comment,
    required this.description,
    required this.homepage,
    required this.icon,
    required this.defaultBranch,
    required this.mainRef,
    required this.remoteType,
    required this.filter,
    required this.appstreamTimestamp,
    required this.appstreamDir,
    required this.gpgVerify,
    required this.noEnumerate,
    required this.noDeps,
    required this.disabled,
    required this.prio,
  });

  String name;

  String url;

  String collectionId;

  String title;

  String comment;

  String description;

  String homepage;

  String icon;

  String defaultBranch;

  String mainRef;

  String remoteType;

  String filter;

  String appstreamTimestamp;

  String appstreamDir;

  bool gpgVerify;

  bool noEnumerate;

  bool noDeps;

  bool disabled;

  int prio;

  Object encode() {
    return <Object?>[
      name,
      url,
      collectionId,
      title,
      comment,
      description,
      homepage,
      icon,
      defaultBranch,
      mainRef,
      remoteType,
      filter,
      appstreamTimestamp,
      appstreamDir,
      gpgVerify,
      noEnumerate,
      noDeps,
      disabled,
      prio,
    ];
  }

  static Remote decode(Object result) {
    result as List<Object?>;
    return Remote(
      name: result[0]! as String,
      url: result[1]! as String,
      collectionId: result[2]! as String,
      title: result[3]! as String,
      comment: result[4]! as String,
      description: result[5]! as String,
      homepage: result[6]! as String,
      icon: result[7]! as String,
      defaultBranch: result[8]! as String,
      mainRef: result[9]! as String,
      remoteType: result[10]! as String,
      filter: result[11]! as String,
      appstreamTimestamp: result[12]! as String,
      appstreamDir: result[13]! as String,
      gpgVerify: result[14]! as bool,
      noEnumerate: result[15]! as bool,
      noDeps: result[16]! as bool,
      disabled: result[17]! as bool,
      prio: result[18]! as int,
    );
  }
}

class Application {
  Application({
    required this.name,
    required this.id,
    required this.summary,
    required this.version,
    required this.origin,
    required this.license,
    required this.installedSize,
    required this.deployDir,
    required this.isCurrent,
    required this.contentRatingType,
    required this.contentRating,
    required this.latestCommit,
    required this.eol,
    required this.eolRebase,
    required this.subpaths,
    required this.metadata,
    required this.appdata,
  });

  String name;

  String id;

  String summary;

  String version;

  String origin;

  String license;

  int installedSize;

  String deployDir;

  bool isCurrent;

  String contentRatingType;

  Map<String?, Object?> contentRating;

  String latestCommit;

  String eol;

  String eolRebase;

  List<String> subpaths;

  String metadata;

  String appdata;

  Object encode() {
    return <Object?>[
      name,
      id,
      summary,
      version,
      origin,
      license,
      installedSize,
      deployDir,
      isCurrent,
      contentRatingType,
      contentRating,
      latestCommit,
      eol,
      eolRebase,
      subpaths,
      metadata,
      appdata,
    ];
  }

  static Application decode(Object result) {
    result as List<Object?>;
    return Application(
      name: result[0]! as String,
      id: result[1]! as String,
      summary: result[2]! as String,
      version: result[3]! as String,
      origin: result[4]! as String,
      license: result[5]! as String,
      installedSize: result[6]! as int,
      deployDir: result[7]! as String,
      isCurrent: result[8]! as bool,
      contentRatingType: result[9]! as String,
      contentRating: (result[10] as Map<Object?, Object?>?)!.cast<String?, Object?>(),
      latestCommit: result[11]! as String,
      eol: result[12]! as String,
      eolRebase: result[13]! as String,
      subpaths: (result[14] as List<Object?>?)!.cast<String>(),
      metadata: result[15]! as String,
      appdata: result[16]! as String,
    );
  }
}

class Installation {
  Installation({
    required this.id,
    required this.displayName,
    required this.path,
    required this.noInteraction,
    required this.isUser,
    required this.priority,
    required this.defaultLanaguages,
    required this.defaultLocale,
    required this.remotes,
  });

  String id;

  String displayName;

  String path;

  bool noInteraction;

  bool isUser;

  int priority;

  List<String> defaultLanaguages;

  List<String> defaultLocale;

  List<Remote> remotes;

  Object encode() {
    return <Object?>[
      id,
      displayName,
      path,
      noInteraction,
      isUser,
      priority,
      defaultLanaguages,
      defaultLocale,
      remotes,
    ];
  }

  static Installation decode(Object result) {
    result as List<Object?>;
    return Installation(
      id: result[0]! as String,
      displayName: result[1]! as String,
      path: result[2]! as String,
      noInteraction: result[3]! as bool,
      isUser: result[4]! as bool,
      priority: result[5]! as int,
      defaultLanaguages: (result[6] as List<Object?>?)!.cast<String>(),
      defaultLocale: (result[7] as List<Object?>?)!.cast<String>(),
      remotes: (result[8] as List<Object?>?)!.cast<Remote>(),
    );
  }
}


class _PigeonCodec extends StandardMessageCodec {
  const _PigeonCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is int) {
      buffer.putUint8(4);
      buffer.putInt64(value);
    }    else if (value is Remote) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    }    else if (value is Application) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    }    else if (value is Installation) {
      buffer.putUint8(131);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 129: 
        return Remote.decode(readValue(buffer)!);
      case 130: 
        return Application.decode(readValue(buffer)!);
      case 131: 
        return Installation.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class FlatpakApi {
  /// Constructor for [FlatpakApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  FlatpakApi({BinaryMessenger? binaryMessenger, String messageChannelSuffix = ''})
      : pigeonVar_binaryMessenger = binaryMessenger,
        pigeonVar_messageChannelSuffix = messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
  final BinaryMessenger? pigeonVar_binaryMessenger;

  static const MessageCodec<Object?> pigeonChannelCodec = _PigeonCodec();

  final String pigeonVar_messageChannelSuffix;

  /// Get Flatpak version.
  Future<String> getVersion() async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.flatpak_flutter.FlatpakApi.getVersion$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(null) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as String?)!;
    }
  }

  /// Get the default flatpak arch
  Future<String> getDefaultArch() async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.flatpak_flutter.FlatpakApi.getDefaultArch$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(null) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as String?)!;
    }
  }

  /// Get all arches supported by flatpak
  Future<List<String?>> getSupportedArches() async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.flatpak_flutter.FlatpakApi.getSupportedArches$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(null) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as List<Object?>?)!.cast<String?>();
    }
  }

  /// Returns a list of Flatpak system installations.
  Future<List<Installation>> getSystemInstallations() async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.flatpak_flutter.FlatpakApi.getSystemInstallations$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(null) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as List<Object?>?)!.cast<Installation>();
    }
  }

  /// Returns user flatpak installation.
  Future<Installation> getUserInstallation() async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.flatpak_flutter.FlatpakApi.getUserInstallation$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(null) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as Installation?)!;
    }
  }

  /// Add a remote repository.
  Future<bool> remoteAdd(Remote configuration) async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.flatpak_flutter.FlatpakApi.remoteAdd$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[configuration]) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as bool?)!;
    }
  }

  /// Remove Remote configuration.
  Future<bool> remoteRemove(String id) async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.flatpak_flutter.FlatpakApi.remoteRemove$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[id]) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as bool?)!;
    }
  }

  /// Get a list of applications installed on machine.
  Future<List<Application>> getApplicationsInstalled() async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.flatpak_flutter.FlatpakApi.getApplicationsInstalled$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(null) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as List<Object?>?)!.cast<Application>();
    }
  }

  /// Get list of applications hosted on a remote.
  Future<List<Remote>> getApplicationsRemote(String id) async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.flatpak_flutter.FlatpakApi.getApplicationsRemote$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[id]) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as List<Object?>?)!.cast<Remote>();
    }
  }

  /// Install application of given id.
  Future<bool> applicationInstall(String id) async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.flatpak_flutter.FlatpakApi.applicationInstall$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[id]) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as bool?)!;
    }
  }

  /// Uninstall application with specified id.
  Future<bool> applicationUninstall(String id) async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.flatpak_flutter.FlatpakApi.applicationUninstall$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[id]) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as bool?)!;
    }
  }

  /// Start application using specified configuration.
  Future<bool> applicationStart(String id, Map<String?, Object?>? configuration) async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.flatpak_flutter.FlatpakApi.applicationStart$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[id, configuration]) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as bool?)!;
    }
  }

  /// Stop application with given id.
  Future<bool> applicationStop(String id) async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.flatpak_flutter.FlatpakApi.applicationStop$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[id]) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as bool?)!;
    }
  }
}
