# React Native Key Value Storage

Provides an easy way to store small key-value data and then access it from the native code.

Apparent use case is to share settings between js part and a long running tasks wrote in a native lang (services, background tasks etc).

Library build on [SharedPreferences](https://developer.android.com/reference/android/content/SharedPreferences.html) on Android and on [UserDefaults](https://developer.apple.com/documentation/foundation/userdefaults) in iOS.


Note: currently support only String values, to store other types use JSON representation of your data

### Usage

##### JS

``` js
import KeyValueStorage from 'react-native-key-value-storage'

await KeyValueStorage.set("key", "value")

const stored = await KeyValueStorage.get("key") // "value"

await KeyValueStorage.remove("key")

```
#### Java

``` java
import com.mt.RNKeyValueStorage.KeyValueStorageModule;

KeyValueStorageModule.get("key", context)

```
#### Swift

``` swift
KeyValueStorage.get("key")

```


### Methods

- `get(key: string) => Promise<string>`

- `set(key: string, value: string) => Promise<boolean>`

- `remove(key: string) => Promise<boolean>`

### Installation

- In your project:
```sh
$ npm i react-native-key-value-storage -S
```
#### Android

```sh
$ react-native link react-native-key-value-storage
```

#### iOS

Unfortunately react native is not supporting linking swift projects, so prepare your hands ;)

- Open up your project in xcode and right click the package.
- Click **Add files to 'Your project name'**
- Navigate to **/node_modules/react-native-key-value-storage/ios**
- Choose **RNKeyValueStorage** folder and click 'Add'
- Click your project in the navigator on the left and go to **build settings**
- Search for **Objective-C Bridging Header**
- Double click on the empty column
- Enter **../node_modules/react-native-key-value-storage/ios/RNKeyValueStorage/KeyValueStorage-Bridging-Header.h**
- Have fun
