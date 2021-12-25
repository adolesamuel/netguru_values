import 'package:hive/hive.dart';
import 'package:netguru_values/core/errors/exception.dart';

abstract class NGValueLocalDataSource {
  Future<List<String>> addToFavourites(String value);
  Future<List<String>> addToValues(String value);
  Future<List<String>> getFavourites();
  Future<List<String>> getMyValues();
  Future<List<String>> removeFromFavourites(String value);
  Future<List<String>> removeFromValues(String value);
  Future<int> setTheme(int value);
  Future<int> getTheme();
}

class NGValueLocalDataSourceImpl implements NGValueLocalDataSource {
  @override
  Future<List<String>> addToFavourites(String value) async {
    final box = await Hive.openBox('favourite');

    List<String> valuesList = [];

    try {
      //holds the modelled json value strings under favourite key
      final valuesAsJsonList = box.get('favourite');

      if (valuesAsJsonList != null) {
        //iterate and add to ValuesList

        for (final String valueJson in valuesAsJsonList) {
          valuesList.add(valueJson);
        }
        //now we have the old favourites in a list.

        //add recent favourite value
        valuesList.add(value);

        //now store to hive
        await box.put('favourite', valuesList);
      } else {
        //list is empty
        //this is the first favourite to add
        valuesList.add(value);

        await box.put('favourite', valuesList);
      }

      return valuesList;
    } catch (e) {
      throw CommonException(e.toString());
    } finally {
      box.close();
    }
  }

  @override
  Future<List<String>> addToValues(String value) async {
    final box = await Hive.openBox('value');

    List<String> valuesList = [];

    try {
      //holds the modelled json value string sunder favourite key
      final valuesAsJsonList = box.get('value');

      if (valuesAsJsonList != null) {
        //iterate and add to valuesList

        for (final String valueString in valuesAsJsonList) {
          valuesList.add(valueString);
        }

        //add new value
        valuesList.add(value);

        await box.put('value', valuesList);
      } else {
        //list is empty
        //first value going into the list
        valuesList.add(value);

        await box.put('value', valuesList);
      }
      return valuesList;
    } catch (e) {
      throw CommonException(e.toString());
    } finally {
      box.close();
    }
  }

  @override
  Future<List<String>> getFavourites() async {
    final box = await Hive.openBox('favourite');

    List<String> valuesList = [];

    try {
      final valuesAsJsonList = box.get('favourite');
      if (valuesAsJsonList != null) {
        //it's not empty

        for (var valueJson in valuesAsJsonList) {
          valuesList.add(valueJson);
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
  Future<List<String>> getMyValues() async {
    final box = await Hive.openBox('value');

    List<String> valuesList = [];

    try {
      final valuesAsJsonList = box.get('value');
      if (valuesAsJsonList != null) {
        //it's not empty

        for (var valueJson in valuesAsJsonList) {
          valuesList.add(valueJson);
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
  Future<List<String>> removeFromFavourites(String value) async {
    final box = await Hive.openBox('favourite');

    List<String> valuesList = [];

    try {
      //get the list of json values
      final valuesAsJsonList = box.get('favourite');
      if (valuesAsJsonList != null) {
        //convert to object, remove item and convert back to json

        for (var valueJson in valuesAsJsonList) {
          valuesList.add(valueJson);
        }

        //remove where
        valuesList.remove(value);

        //you have to put the new list in place of the old one.
        await box.put('favourite', valuesList);
      }
      return valuesList;
    } catch (e) {
      throw CommonException(e.toString());
    } finally {
      box.close();
    }
  }

  @override
  Future<List<String>> removeFromValues(String value) async {
    final box = await Hive.openBox('value');

    List<String> valuesList = [];

    try {
      //get the list of json values
      final valuesAsJsonList = box.get('value');
      if (valuesAsJsonList != null) {
        //convert to object, remove item and convert back to json

        for (var valueJson in valuesAsJsonList) {
          valuesList.add(valueJson);
        }

        //remove where
        valuesList.remove(value);

        //you have to put the new list in place of the old one.
        await box.put('favourite', valuesList);
      }
      return valuesList;
    } catch (e) {
      throw CommonException(e.toString());
    } finally {
      box.close();
    }
  }

  @override
  Future<int> getTheme() async {
    final box = await Hive.openBox('theme');

    try {
      final value = box.get('theme');

      if (value != null) {
        return value;
      } else {
        var value = 0;
        return value;
      }
    } catch (e) {
      throw CommonException(e.toString());
    } finally {
      box.close();
    }
  }

  @override
  Future<int> setTheme(int value) async {
    final box = await Hive.openBox('theme');
    try {
      await box.put('theme', value);
      return value;
    } catch (e) {
      throw CommonException(e.toString());
    } finally {
      box.close();
    }
  }
}
