class MethodConstants {
  // Setup and Login methods
  static const String initSDK = "itemoptix#init";
  static const String getVersion = "itemoptix#getversion";
  static const String registerDevice = "itemoptix#register";

  // Common event methods
  static const String itemOptixEvent = "itemoptix#event";

  // Device manager methods
  static const String getDevices = "device#getall";
  static const String connectDevice = "device#connect";
  static const String disconnectDevice = "device#disconnect";
  static const String setRegulatoryRegion = "device#setregulatoryregion";

  // Cycle count methods
  static const String ccSetLocation = "cc#set#location";
  static const String ccSetFilter = "cc#set#filter";
  static const String ccSetConfig = "cc#set#config";
  static const String ccSetTask = "cc#set#task";
  static const String ccBuildUseCase = "cc#build";
  static const String ccCreateSession = "cc#createsession";
  static const String ccCancel = "cc#cancel";
  static const String ccSubmit = "cc#submit";
  static const String ccStartRead = "cc#startread";
  static const String ccStopRead = "cc#stopread";
  static const String ccGetSummary = "cc#get#summary";
  static const String ccGetDetails = "cc#get#details";

  // Cycle count event methods
  static const String ccEventSummary = "cc#event#summary";
  static const String ccEventDetails = "cc#event#details";
  static const String ccEventSession = "cc#event#session";
  static const String ccEventError = "cc#event#error";
  static const String ccEventComplete = "cc#event#complete";

  // Location methods
  static const String locationsGetAll = "locations#get#all";
  static const String locationsGetCC = "locations#get#cc";
  static const String locationsByFilter = "locations#get#filter";
}
