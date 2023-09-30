import 'package:transaction_app/base_redux/base_dispatch.dart';
import 'package:transaction_app/data/repositories/local_repository.dart';

class SplashViewModel extends BaseDispatch {
  LocalRepository localRepository;

  SplashViewModel(this.localRepository);
}
