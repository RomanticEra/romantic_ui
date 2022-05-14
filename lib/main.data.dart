

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: directives_ordering, top_level_function_literal_block

import 'package:flutter_data/flutter_data.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider/path_provider.dart';


import 'package:romantic_ui/folio/model/app_model.dart';
import 'package:romantic_ui/folio/model/themes.dart';

// ignore: prefer_function_declarations_over_variables
ConfigureRepositoryLocalStorage configureRepositoryLocalStorage = ({FutureFn<String>? baseDirFn, List<int>? encryptionKey, bool? clear}) {
  if (!kIsWeb) {
    baseDirFn ??= () => getApplicationDocumentsDirectory().then((dir) => dir.path);
  } else {
    baseDirFn ??= () => '';
  }
  
  return hiveLocalStorageProvider
    .overrideWithProvider(Provider((ref) => HiveLocalStorage(
            hive: ref.read(hiveProvider),
            baseDirFn: baseDirFn,
            encryptionKey: encryptionKey,
            clear: clear,
          )));
};

// ignore: prefer_function_declarations_over_variables
RepositoryInitializerProvider repositoryInitializerProvider = (
        {bool? remote, bool? verbose}) {
  return _repositoryInitializerProviderFamily(
      RepositoryInitializerArgs(remote, verbose));
};

final repositoryProviders = <String, Provider<Repository<DataModel>>>{
  'appModels': appModelsRepositoryProvider,
'appThemes': appThemesRepositoryProvider,
'touchModes': touchModesRepositoryProvider
};

final _repositoryInitializerProviderFamily =
  FutureProvider.family<RepositoryInitializer, RepositoryInitializerArgs>((ref, args) async {
    final adapters = <String, RemoteAdapter>{'appModels': ref.watch(appModelsRemoteAdapterProvider), 'appThemes': ref.watch(appThemesRemoteAdapterProvider), 'touchModes': ref.watch(touchModesRemoteAdapterProvider)};
    final remotes = <String, bool>{'appModels': false, 'appThemes': false, 'touchModes': false};

    await ref.watch(graphNotifierProvider).initialize();

    final _repoMap = {
      for (final type in repositoryProviders.keys)
        type: ref.watch(repositoryProviders[type]!)
    };

    for (final type in _repoMap.keys) {
      final repository = _repoMap[type]!;
      repository.dispose();
      await repository.initialize(
        remote: args.remote ?? remotes[type],
        verbose: args.verbose,
        adapters: adapters,
      );
    }

    ref.onDispose(() {
      for (final repository in _repoMap.values) {
        repository.dispose();
      }
    });

    return RepositoryInitializer();
});
