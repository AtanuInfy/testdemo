package com.checkpt.itemoptix.plugin;

import com.checkpt.itemoptix.sdk.common.CCDetailsLevel;
import com.checkpt.itemoptix.sdk.common.Filter;
import com.checkpt.itemoptix.sdk.common.GenericError;
import com.checkpt.itemoptix.sdk.common.JsonUtil;
import com.checkpt.itemoptix.sdk.common.Location;
import com.checkpt.itemoptix.sdk.common.Result;
import com.checkpt.itemoptix.sdk.common.Task;
import com.checkpt.itemoptix.sdk.device.common.TriggerMode;
import com.checkpt.itemoptix.sdk.usecase.CycleCount;
import com.checkpt.itemoptix.sdk.usecase.CycleCountBuilder;
import com.checkpt.itemoptix.sdk.usecase.common.CountDetails;
import com.checkpt.itemoptix.sdk.usecase.common.CountSummary;
import com.checkpt.itemoptix.sdk.usecase.common.CycleCountConfig;
import com.checkpt.itemoptix.sdk.usecase.common.CycleCountListener;
import com.checkpt.itemoptix.sdk.usecase.common.InventorySession;

import java.util.Map;

public class CycleCountAPI implements CycleCountListener {


    private static CycleCountAPI instance;
    private final CycleCountBuilder builder;
    private CycleCount cycleCount;

    private CycleCountAPI() {
        builder = CycleCount.builder();
    }

    static CycleCountAPI getInstance() {
        if (instance == null) {
            instance = new CycleCountAPI();
        }
        return instance;
    }

    void setLocation(Map<String, Object> locationMap) {
        Location location = JsonUtil.fromMap(locationMap, Location.class);
        builder.setLocation(location);
    }

    void setFilter(Map<String, Object> filterMap) {
        Filter filter = JsonUtil.fromMap(filterMap, Filter.class);
        builder.setFilter(filter);
    }

    void setUseCaseConfig(Map<String, Object> configMap) {
        CycleCountConfig cycleCountConfig = JsonUtil.fromMap(configMap, CycleCountConfig.class);
        builder.setConfig(cycleCountConfig);

    }

    void setTask(Map<String, Object> taskMap) {
        Task task = JsonUtil.fromMap(taskMap, Task.class);
        builder.setTask(task);
    }

    Map<String, Object> build() {
        builder.setCountListener(this);
        Result<CycleCount> result = builder.build();
        if (result.isSuccess()) {
            cycleCount = result.success();
            return new Result<>(true).toMap();
        }
        return result.toMap();
    }

    void createSession() {
        cycleCount.createSession();
    }

    void startReader() {
        cycleCount.startReader(TriggerMode.IMMEDIATE);
    }

    void stopReader() {
        cycleCount.stopReader();
    }

    void getCountSummary() {
        cycleCount.getCountSummary();
    }

    void getCountDetails(Map<String, Object> detailsLevelMap) {
        CCDetailsLevel detailsLevel = JsonUtil.fromMap(detailsLevelMap, CCDetailsLevel.class);
        cycleCount.getCountDetails(detailsLevel);
    }

    void submit() {
        cycleCount.submit();
    }

    void cancel() {
        cycleCount.cancel();
    }

    @Override
    public void onSummaryChange(CountSummary countSummary) {
        Map<String, Object> countSummaryMap = JsonUtil.toMap(countSummary);
        FlutterCkpPlugin.notifyUseCaseListener(MethodConstants.ccEventSummary, countSummaryMap);
    }

    @Override
    public void onDetailsChange(CountDetails countDetails) {
        Map<String, Object> countDetailsMap = JsonUtil.toMap(countDetails);
        FlutterCkpPlugin.notifyUseCaseListener(MethodConstants.ccEventDetails, countDetailsMap);
    }

    @Override
    public void onSessionSuccess(InventorySession inventorySession) {
        Map<String, Object> inventorySessionMap = JsonUtil.toMap(inventorySession);
        FlutterCkpPlugin.notifyUseCaseListener(MethodConstants.ccEventSession, inventorySessionMap);
    }

    @Override
    public void onError(GenericError error) {
        FlutterCkpPlugin.notifyUseCaseListener(MethodConstants.ccEventError, JsonUtil.toMap(error));
    }

    @Override
    public void onSessionComplete() {
        FlutterCkpPlugin.notifyUseCaseListener(MethodConstants.ccEventComplete, null);
    }
}
