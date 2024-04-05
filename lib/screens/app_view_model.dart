import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final idTypeProvider = StateProvider<String?>((ref) => null);

final rateProvider = StateProvider<int>((ref) => 0);

final hasConnectedWalletProvider = StateProvider<bool>((ref) => false);
