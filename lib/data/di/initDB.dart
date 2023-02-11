import 'package:appsche/data/local/driff/repo/task_repo.dart';
import 'package:appsche/data/local/driff/repo/task_repo_impl.dart';

import '../../main.dart';
import '../local/driff/db/db_app.dart';

void initDBandLocalRepo() {
  instance.registerLazySingleton<AppDb>(() => AppDb());
  instance.registerLazySingleton<TaskLocalRepository>(
      () => TaskLocalRepoImpl(instance.get<AppDb>()));
}
