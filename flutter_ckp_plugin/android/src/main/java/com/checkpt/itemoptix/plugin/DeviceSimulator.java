package com.checkpt.itemoptix.plugin;

import com.checkpt.itemoptix.core.device.DeviceType;
import com.checkpt.itemoptix.sdk.common.Result;
import com.checkpt.itemoptix.sdk.device.common.AbstractRFIDReader;
import com.checkpt.itemoptix.sdk.device.common.Device;
import com.checkpt.itemoptix.sdk.device.common.TagInfo;
import com.checkpt.itemoptix.sdk.device.common.TagLockCriteria;
import com.checkpt.itemoptix.sdk.device.common.TagReadCriteria;
import com.checkpt.itemoptix.sdk.device.common.TagWriteCriteria;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

public class DeviceSimulator extends AbstractRFIDReader {

    long serialNumber = 0;
    Timer timer;
    private Device device;

    @Override
    public Result<Map<String, String>> getSupportedRegulatoryRegions() {
        return null;
    }

    @Override
    public Result<Boolean> setRegulatoryRegion(String s) {
        return new Result<>(true);
    }

    @Override
    public Result<Boolean> startBarcodeRead() {
        return null;
    }

    @Override
    public Result<Boolean> stopBarcodeRead() {
        return null;
    }

    @Override
    public void setScanState(boolean b) {

    }

    @Override
    public Result<Boolean> connect(Device device) {
        this.device = device;
        return new Result<>(true);
    }

    @Override
    public Result<Boolean> disconnect() {
        device = null;
        return new Result<>(true);
    }

    @Override
    public boolean isConnected() {
        return device != null;
    }

    @Override
    public Result<List<Device>> getAvailableDevices() {
        Device device1 = new Device("Simulator1", "Mac-Address-1", "SIM_DEVICE", DeviceType.rfidBTReader);
        List<Device> devices = Collections.singletonList(device1);
        return new Result<>(devices);
    }

    @Override
    public Result<Device> getDevice() {
        return new Result<>(device);
    }

    @Override
    public Result<Boolean> startInventory() {
        if (timer == null) {
            timer = new Timer();
        }
        timer.schedule(new TimerTask() {
            @Override
            public void run() {
                List<TagInfo> tagInfos = new ArrayList<>();
                for (int i = 0; i < 100; i++) {
                    TagInfo tagInfo = new TagInfo("3034300A000A9400" + String.format("%08X", serialNumber++),
                            System.currentTimeMillis());
                    tagInfos.add(tagInfo);
                }
                notifyMultiTagReads(tagInfos);
            }
        }, 100, 1000);
        return new Result<>(true);
    }

    @Override
    public Result<Boolean> stopInventory() {
        if (timer != null) {
            timer.cancel();
            timer = null;
        }
        return new Result<>(true);
    }

    @Override
    public Result<Boolean> readTag(TagReadCriteria tagReadCriteria, int i) {
        return null;
    }

    @Override
    public Result<Boolean> write(TagWriteCriteria tagWriteCriteria, int i) {
        return null;
    }

    @Override
    public Result<Boolean> lock(TagLockCriteria tagLockCriteria, int i) {
        return null;
    }

    @Override
    public Result<Boolean> startLocate() {
        return null;
    }

    @Override
    public Result<Boolean> stopLocate() {
        return null;
    }
}
