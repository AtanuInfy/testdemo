package com.checkpt.itemoptix.plugin;

import com.checkpt.itemoptix.sdk.common.JsonUtil;
import com.checkpt.itemoptix.sdk.common.Module;
import com.checkpt.itemoptix.sdk.device.DeviceManager;
import com.checkpt.itemoptix.sdk.device.common.Device;

import java.util.Map;

public class DeviceManagerAPI {

    static Map<String, Object> getAvailableDevices() {
        return DeviceManager.getSharedInstance(Module.setup).success().getAvailableDevices().toMap();
    }

    static Map<String, Object> connect(Map<String, Object> device) {
        Device device1 = JsonUtil.fromMap(device, Device.class);
        return DeviceManager.getSharedInstance(Module.setup).success().connect(device1).toMap();
    }

    static Map<String, Object> disConnect(Map<String, Object> device) {
        Device device1 = JsonUtil.fromMap(device, Device.class);
        return DeviceManager.getSharedInstance(Module.setup).success().disconnect(device1).toMap();
    }

    static Map<String, Object> setRegulatoryRegion(Map<String, Object> device, String regulatoryRegion) {
        Device device1 = JsonUtil.fromMap(device, Device.class);
        return DeviceManager.getSharedInstance(Module.setup).success().setRegulatoryRegion(device1, regulatoryRegion)
                .toMap();
    }

    static void registerSimulatorDriver() {
        DeviceManager.getSharedInstance(Module.setup).success().registerDriver("SIM_DEVICE", DeviceSimulator.class);
    }

}
