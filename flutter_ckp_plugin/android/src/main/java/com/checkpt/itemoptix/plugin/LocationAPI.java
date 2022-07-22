package com.checkpt.itemoptix.plugin;

import com.checkpt.itemoptix.sdk.LocationManager;
import com.checkpt.itemoptix.sdk.common.JsonUtil;
import com.checkpt.itemoptix.sdk.common.LocationFilter;
import com.checkpt.itemoptix.sdk.common.LocationFilterType;
import com.checkpt.itemoptix.sdk.common.Module;

import java.util.Collections;
import java.util.Map;

public class LocationAPI {
    static Map<String, Object> getAllSubLocations(String module) {
        LocationManager locationManager = new LocationManager(Module.useCase(module));
        return locationManager.getLocations(LocationFilter.none()).toMap();
    }

    static Map<String, Object> getSubLocations(String module, Map<String, Object> locationFilter) {
        LocationManager locationManager = new LocationManager(Module.useCase(module));
        LocationFilter filter = JsonUtil.fromMap(locationFilter, LocationFilter.class);

        LocationFilter filter1 = new LocationFilter();
        filter1.setFilterType(LocationFilterType.type);
        filter1.setFilterValues(Collections.singletonList("BUSINESS_LOCATION"));
        filter.addAndCondition(filter1);

        return locationManager.getLocations(filter).toMap();
    }

    static Map<String, Object> getCCSubLocations(String module) {
        LocationManager locationManager = new LocationManager(Module.useCase(module));

        LocationFilter filter1 = new LocationFilter();
        filter1.setFilterType(LocationFilterType.type);
        filter1.setFilterValues(Collections.singletonList("BUSINESS_LOCATION"));

        LocationFilter filter2 = new LocationFilter();
        filter2.setFilterType(LocationFilterType.attribute);
        filter2.setNameForAttributeType("IsCycleCountLocation");
        filter2.setFilterValues(Collections.singletonList("YES"));
        filter1.addAndCondition(filter2);
        return locationManager.getLocations(filter1).toMap();
    }

}
