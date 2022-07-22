package com.checkpt.itemoptix.plugin;

public class MethodConstants {
    // Setup and Login methods
    static final String initSDK = "itemoptix#init";
    static final String getVersion = "itemoptix#getversion";
    static final String registerDevice = "itemoptix#register";

    // Common event methods
    static final String itemOptixEvent = "itemoptix#event";

    // Device manager methods
    static final String getDevices = "device#getall";
    static final String connectDevice = "device#connect";
    static final String disconnectDevice = "device#disconnect";
    static final String setRegulatoryRegion = "device#setregulatoryregion";

    // Cycle count methods
    static final String ccSetLocation = "cc#set#location";
    static final String ccSetFilter = "cc#set#filter";
    static final String ccSetConfig = "cc#set#config";
    static final String ccSetTask = "cc#set#task";
    static final String ccBuildUseCase = "cc#build";
    static final String ccCreateSession = "cc#createsession";
    static final String ccCancel = "cc#cancel";
    static final String ccSubmit = "cc#submit";
    static final String ccStartRead = "cc#startread";
    static final String ccStopRead = "cc#stopread";
    static final String ccGetSummary = "cc#get#summary";
    static final String ccGetDetails = "cc#get#details";

    // Cycle count event methods
    static final String ccEventSummary = "cc#event#summary";
    static final String ccEventDetails = "cc#event#details";
    static final String ccEventSession = "cc#event#session";
    static final String ccEventError = "cc#event#error";
    static final String ccEventComplete = "cc#event#complete";

    // Location methods
    static final String locationsGetAll = "locations#get#all";
    static final String locationsGetCC = "locations#get#cc";
    static final String locationsByFilter = "locations#get#filter";
}
