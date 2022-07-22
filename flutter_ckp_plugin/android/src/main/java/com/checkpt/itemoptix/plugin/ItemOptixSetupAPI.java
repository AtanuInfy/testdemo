package com.checkpt.itemoptix.plugin;

import android.content.Context;

import androidx.annotation.NonNull;

import com.checkpt.itemoptix.sdk.ItemOptix;
import com.checkpt.itemoptix.sdk.Logger;
import com.checkpt.itemoptix.sdk.common.DefaultSetupInfoProvider;
import com.checkpt.itemoptix.sdk.common.JsonUtil;
import com.checkpt.itemoptix.sdk.common.LogLevel;
import com.checkpt.itemoptix.sdk.common.Result;

import io.flutter.plugin.common.MethodChannel;

class ItemOptixSetupAPI {
    static boolean initSDK(Context appContext) {
        Result<Boolean> status = ItemOptix.init(appContext, "");
        if (status.isSuccess()) {
            Logger.set(LogLevel.debug);
        }
        return status.success();
    }

    static String getBuildVersion() {
        return ItemOptix.getVersion().success();
    }

    static void registerDevice(String encodedParam, @NonNull MethodChannel.Result result) {
        DefaultSetupInfoProvider defaultSetupInfoProvider = new DefaultSetupInfoProvider(encodedParam);
        ItemOptix.registerDevice(defaultSetupInfoProvider, response -> {
            if (response.isSuccess()) {
                result.success(JsonUtil.toMap(defaultSetupInfoProvider.getSetupInfo()));
            } else {
                result.success(JsonUtil.toMap(response.failure()));
            }
        });
    }
}
