# React Native Key Value Storage

Provides an easy way to persistently store small chunks of data and then access it from the native code.

Apparent use case is to share settings between js part and long running tasks wrote on a native lang (services, background tasks etc).

Library is built upon [SharedPreferences](https://developer.android.com/reference/android/content/SharedPreferences.html) on Android and on [UserDefaults](https://developer.apple.com/documentation/foundation/userdefaults) on iOS.


Note: currently supports only string values. To store other types use the JSON representation.

### Usage

##### JS

``` js
import KeyValueStorage from "react-native-key-value-storage"

(async () => {
    try {
        await KeyValueStorage.set("key", "value")
        const stored = await KeyValueStorage.get("key") // "value"
        await KeyValueStorage.remove("key")
    } catch(error) {
        // Handle error
    }
})()

```
#### Java

``` java
import com.mt.RNKeyValueStorage.KeyValueStorageModule;

KeyValueStorageModule.set("key", "value", context);
KeyValueStorageModule.get("key", context);
KeyValueStorageModule.remove("key", context);

```
#### Objective-c

``` objective-c
#import "RNKeyValueStorage.h"

[KeyValueStorage setForKey:@"key" andValue:@"value"];
NSString *stored = [KeyValueStorage getForKey:@"key"];
[KeyValueStorage removeForKey:@"key"];

```

### Dependency

- Use version `3.x.x` for RN `>= 0.47.0`
- Use version `1.x.x` for RN `< 0.47.0`

### Methods

- `get(key: string) => Promise<string>`

- `set(key: string, value: string) => Promise<void>`

- `remove(key: string) => Promise<void>`

### Installation

- In your project:
```sh
$ npm i react-native-key-value-storage -S

```
#### Link native code

```sh
$ react-native link react-native-key-value-storage

```
