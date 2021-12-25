import 'package:hive/hive.dart';
import 'package:netguru_values/core/errors/exception.dart';
import 'package:netguru_values/features/netguru/data/model/ng_value_model.dart';

abstract class NGValueLocalDataSource {
  Future<List<NGValueModel>> addToFavourites(NGValueModel value);
  Future<List<NGValueModel>> addToValues(NGValueModel value);
  Future<List<NGValueModel>> getFavourites();
  Future<List<NGValueModel>> getMyValues();
  Future<List<NGValueModel>> removeFromFavourites(NGValueModel value);
  Future<List<NGValueModel>> removeFromValues(NGValueModel value);
}

class NGValueLocalDataSourceImpl implements NGValueLocalDataSource {
  @override
  Future<List<NGValueModel>> addToFavourites(NGValueModel value) async {
    final box = await Hive.openBox('favourite');

    List<NGValueModel> valuesList = [];

    try {
      //holds the modelled json value strings under favourite key
      final valuesAsJsonList = box.get('favourite');

      List<String> newValuesList = [];

      if (valuesAsJsonList != null) {
        //iterate and add to ValuesList

        for (final String valueJson in valuesAsJsonList) {
          var oldValue = NGValueModel.fromJson(valueJson);

          valuesList.add(oldValue);
        }
        //now we have the old favourites in a list.

        //add recent favourite value
        valuesList.add(value);

        //now store to hive
        for (var item in valuesList) {
          final itemAsJson = item.toJson();

          newValuesList.add(itemAsJson);
          //all items in valuesList should be added.
        }

        await box.put('favourite', newValuesList);
      } else {
        //list is empty
        //this is the first favourite to add
        valuesList.add(value);
        newValuesList.add(value.toJson());
        await box.put('favourite', newValuesList);
      }

      return valuesList;
    } catch (e) {
      throw CommonException(e.toString());
    } finally {
      box.close();
    }
  }

  @override
  Future<List<NGValueModel>> addToValues(NGValueModel value) async {
    final box = await Hive.openBox('value');

    List<NGValueModel> valuesList = [];

    try {
      //holds the modelled json value string sunder favourite key
      final valuesAsJsonList = box.get('value');

      List<String> newValuesList = [];

      if (valuesAsJsonList != null) {
        //iterate and add to valuesList

        for (final String valueJson in valuesAsJsonList) {
          var oldValue = NGValueModel.fromJson(valueJson);

          valuesList.add(oldValue);
        }

        //add new value
        valuesList.add(value);

        //now store to hive
        for (var item in valuesList) {
          final itemAsJson = item.toJson();

          newValuesList.add(itemAsJson);
          //all items in valuesList should be added
        }
        await box.put('value', newValuesList);
      } else {
        //list is empty
        //first value going into the list
        valuesList.add(value);
        newValuesList.add(value.toJson());
        await box.put('value', newValuesList);
      }
      return valuesList;
    } catch (e) {
      throw CommonException(e.toString());
    } finally {
      box.close();
    }
  }

  @override
  Future<List<NGValueModel>> getFavourites() async {
    final box = await Hive.openBox('favourite');

    List<NGValueModel> valuesList = [];

    try {
      final valuesAsJsonList = box.get('favourite');
      if (valuesAsJsonList != null) {
        //it's not empty

        for (var valueJson in valuesAsJsonList) {
          var oldValue = NGValueModel.fromJson(valueJson);

          valuesList.add(oldValue);
          //all has been added.
        }
      }
      return valuesList;
    } catch (e) {
      throw CommonException(e.toString());
    } finally {
      box.close();
    }
  }

  @override
  Future<List<NGValueModel>> getMyValues() async {
    final box = await Hive.openBox('value');

    List<NGValueModel> valuesList = [];

    try {
      final valuesAsJsonList = box.get('value');
      if (valuesAsJsonList != null) {
        //it's not empty

        for (var valueJson in valuesAsJsonList) {
          var oldValue = NGValueModel.fromJson(valueJson);

          valuesList.add(oldValue);
          //all has been added.
        }
      }
      return valuesList;
    } catch (e) {
      throw CommonException(e.toString());
    } finally {
      box.close();
    }
  }

  @override
  Future<List<NGValueModel>> removeFromFavourites(NGValueModel value) {
    // TODO: implement removeFromFavourites
    throw UnimplementedError();
  }

  @override
  Future<List<NGValueModel>> removeFromValues(NGValueModel value) {
    // TODO: implement removeFromValues
    throw UnimplementedError();
  }
}
