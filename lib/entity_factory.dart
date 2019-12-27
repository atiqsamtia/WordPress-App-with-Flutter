import './model/post_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "PostEntity") {
      return PostEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}
