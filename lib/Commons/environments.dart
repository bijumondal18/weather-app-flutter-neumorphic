enum Env { PROD, SIT, DEV }

class EnvConstant {
  static Env get getEnvironment {
    if (const String.fromEnvironment('ENVIRONMENT') == "PROD") {
      return Env.PROD;
    } else if (const String.fromEnvironment('ENVIRONMENT') == "SIT") {
      return Env.SIT;
    }
    return Env.DEV;
  }

  static bool get isDEV {
    return getEnvironment == Env.DEV;
  }

  static bool get isSIT {
    return getEnvironment == Env.SIT;
  }

  static bool get isPROD {
    return getEnvironment == Env.PROD;
  }
}
