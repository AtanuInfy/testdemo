package com.checkpt.itemoptix.plugin;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;

import androidx.annotation.NonNull;

import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.common.StandardMethodCodec;

/**
 * FlutterCkpPlugin
 */
public class FlutterCkpPlugin implements FlutterPlugin, MethodCallHandler {

    private static final String METHOD_CHANNEL_NAME = "plugins.flutter.checkpt/itemoptix";
    private static final String EVENT_CHANNEL_NAME = "plugins.flutter.checkpt/events";
    private static final String LISTENER_CHANNEL_NAME = "plugins.flutter.checkpt/usecase";
    private static final Handler handler = new Handler(Looper.getMainLooper());
    /**
     * Usecase listener channel to notify use-case change events/data
     */
    private static MethodChannel useCaseListenerChannel;

    /**
     * Global event channel for notifying the SDK events like
     * Device Connected, Disconnected, App Online, Offline, etc
     */
    private static MethodChannel eventChannel;
    private final StandardMethodCodec MESSAGE_CODEC = new StandardMethodCodec(new StandardMessageCodec());
    /**
     * Default channel that gets user actions and notifies the same channel if there are any return values
     */
    private MethodChannel defaultUserActionChannel;
    private Context context;

    public static void notifyEvent(Map<String, Object> event) {
        handler.post(() -> eventChannel.invokeMethod(MethodConstants.itemOptixEvent, event));

    }

    public static void notifyUseCaseListener(String useCase, Map<String, Object> data) {
        handler.post(() -> useCaseListenerChannel.invokeMethod(useCase, data));
    }

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        defaultUserActionChannel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), METHOD_CHANNEL_NAME, MESSAGE_CODEC);
        defaultUserActionChannel.setMethodCallHandler(this);

        context = flutterPluginBinding.getApplicationContext();
        eventChannel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), EVENT_CHANNEL_NAME, MESSAGE_CODEC);
        useCaseListenerChannel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), LISTENER_CHANNEL_NAME, MESSAGE_CODEC);
        DeviceManagerAPI.registerSimulatorDriver();
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        switch (call.method) {
            case MethodConstants.initSDK:
                result.success(ItemOptixSetupAPI.initSDK(context));
                break;
            case MethodConstants.getVersion:
                result.success(ItemOptixSetupAPI.getBuildVersion());
                break;
            case MethodConstants.registerDevice:
                ItemOptixSetupAPI.registerDevice(call.arguments(), result);
                break;
            case MethodConstants.getDevices:
                result.success(DeviceManagerAPI.getAvailableDevices());
                break;
            case MethodConstants.connectDevice:
                result.success(DeviceManagerAPI.connect(call.arguments()));
                break;
            case MethodConstants.disconnectDevice:
                result.success(DeviceManagerAPI.disConnect(call.arguments()));
                break;
            case MethodConstants.setRegulatoryRegion:
                result.success(DeviceManagerAPI.setRegulatoryRegion(call.argument("device"),
                        call.argument("region")));
                break;
            case MethodConstants.locationsGetAll:
                result.success(LocationAPI.getAllSubLocations(call.argument("module")));
                break;
            case MethodConstants.locationsGetCC:
                result.success(LocationAPI.getCCSubLocations(call.argument("module")));
                break;
            case MethodConstants.locationsByFilter:
                result.success(LocationAPI.getSubLocations(call.argument("module"), call.argument("filter")));
                break;
            case MethodConstants.ccBuildUseCase:
                Map<String, Object> location = call.argument("location");
                Map<String, Object> filter = call.argument("filter");
                Map<String, Object> config = call.argument("config");
                if (location != null) {
                    CycleCountAPI.getInstance().setLocation(location);
                }
                if (filter != null) {
                    CycleCountAPI.getInstance().setFilter(filter);
                }
                if (config != null) {
                    CycleCountAPI.getInstance().setUseCaseConfig(config);
                }
                result.success(CycleCountAPI.getInstance().build());
                break;
            case MethodConstants.ccCreateSession:
                CycleCountAPI.getInstance().createSession();
                break;
            case MethodConstants.ccStartRead:
                CycleCountAPI.getInstance().startReader();
                break;
            case MethodConstants.ccStopRead:
                CycleCountAPI.getInstance().stopReader();
                break;
            case MethodConstants.ccSubmit:
                CycleCountAPI.getInstance().submit();
                break;
            case MethodConstants.ccCancel:
                CycleCountAPI.getInstance().cancel();
                break;
            case MethodConstants.ccGetSummary:
                CycleCountAPI.getInstance().getCountSummary();
                break;
            case MethodConstants.ccGetDetails:
                CycleCountAPI.getInstance().getCountDetails(call.arguments());
                break;
            default:
                result.notImplemented();
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        defaultUserActionChannel.setMethodCallHandler(null);
    }
}
