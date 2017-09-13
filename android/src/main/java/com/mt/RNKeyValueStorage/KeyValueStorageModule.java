package com.mt.RNKeyValueStorage;

import android.content.Context;
import android.content.SharedPreferences;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import static android.content.Context.MODE_PRIVATE;

/**
 * Created by kirillpisarev on 11.09.17.
 */

public class KeyValueStorageModule extends ReactContextBaseJavaModule {

    static final private String SHARED_PREF_FILE = "KeyValueStorage";

    public KeyValueStorageModule(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    public String getName() {
        return "KeyValueStorage";
    }

    @ReactMethod
    public void get(String key, Promise promise) {
        try {
            ReactApplicationContext context = getReactApplicationContext();
            String value = get(key, context);
            promise.resolve(value);
        } catch (Throwable e) {
            promise.reject(e.toString());
        }
    }

    static public String get(String key, Context context) {
        SharedPreferences sharedPreferences = context.getSharedPreferences(SHARED_PREF_FILE, MODE_PRIVATE);
        return sharedPreferences.getString(key, null);
    }

    @ReactMethod
    public void set(String key, String value, Promise promise) {
        try {
            ReactApplicationContext context = getReactApplicationContext();
            set(key, value, context);
            promise.resolve(true);
        } catch (Throwable e) {
            promise.reject(e.toString());
        }
    }

    static public void set(String key, String value, Context context) {
        SharedPreferences sharedPreferences = context.getSharedPreferences(SHARED_PREF_FILE, MODE_PRIVATE);
        SharedPreferences.Editor editor = sharedPreferences.edit();
        editor.putString(key, value).apply();
    }

    @ReactMethod
    public void remove(String key, Promise promise) {
        try {
            ReactApplicationContext context = getReactApplicationContext();
            remove(key, context);
            promise.resolve(true);
        } catch (Throwable e) {
            promise.reject(e.toString());
        }
    }

    static public void remove(String key, Context context) {
        SharedPreferences sharedPreferences = context.getSharedPreferences(SHARED_PREF_FILE, MODE_PRIVATE);
        SharedPreferences.Editor editor = sharedPreferences.edit();
        editor.remove(key).apply();
    }

}