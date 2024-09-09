// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../Data/Data_Sources/Firebase_Car_Source.dart' as _i56;
import '../Data/Repo_impl/Car_Repo_impl.dart' as _i5;
import '../Domain/Repo/Car_Repo.dart' as _i93;
import '../Domain/Usecase/fetch_cars_usecase.dart' as _i300;
import '../Presentation/Bloc/car_bloc.dart' as _i478;
import 'depend.dart' as _i65;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseModule = _$FirebaseModule();
    gh.singleton<_i974.FirebaseFirestore>(() => firebaseModule.fire);
    gh.factory<_i56.FirebaseCarSource>(
        () => _i56.FirebaseCarSource(fire: gh<_i974.FirebaseFirestore>()));
    gh.factory<_i93.CarRepo>(
        () => _i5.CarRepoImpl(firebaseCarSource: gh<_i56.FirebaseCarSource>()));
    gh.lazySingleton<_i300.FetchCarsUsecase>(
        () => _i300.FetchCarsUsecase(gh<_i93.CarRepo>()));
    gh.factory<_i478.CarBloc>(() => _i478.CarBloc(
          gh<_i478.CarState>(),
          gh<_i300.FetchCarsUsecase>(),
        ));
    return this;
  }
}

class _$FirebaseModule extends _i65.FirebaseModule {}
