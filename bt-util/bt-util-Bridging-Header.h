//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

#import <foundation/foundation.h>
#import <IOBluetooth/IOBluetooth.h>

@interface IOBluetoothDevice (Private)

+ (id)connectedDevices;
+ (id)recentDevices:(unsigned long long)arg1;
+ (id)configuredDevices;
+ (id)favoriteDevices;
+ (id)pairedDevices;
- (BOOL)isiPad;
- (BOOL)isiPhone;
- (BOOL)isMac;
- (BOOL)isAppleDevice;
- (id)getMacAttributesDictionary;
- (BOOL)isSpecialMicrosoftMouse;
- (BOOL)isKeyboardDevice;
- (BOOL)isPointingDevice;
- (void)getAddress:(struct BluetoothDeviceAddress *)arg1;
- (void)updateName:(id)arg1 lastUpdate:(id)arg2 postNotification:(BOOL)arg3;
- (id)shortDescription;
- (unsigned char)getEncryptionMode;
- (unsigned char)getLinkType;
- (unsigned short)getClockOffset;
@property(readonly) NSString *addressString;
- (id)getAddressString;
- (const struct BluetoothDeviceAddress *)getAddress;
- (id)getDisplayName;
- (void)setDisplayName:(id)arg1;
- (id)getNameOrAddress;
- (id)getName;
- (int)closeConnection;
@property(nonatomic, getter=headsetBattery) long long headsetBatteryPercent;
- (BOOL)isConnected;
- (BOOL)isiCloudPaired;
- (BOOL)isRecent;
- (void)forceRemove;
- (void)remove;
- (unsigned int)configuredServices;
- (BOOL)isConfiguredHIDDevice;
- (BOOL)isConfigured;
- (int)removeFromFavorites;
- (int)addToFavorites;
- (BOOL)isFavorite;
- (BOOL)isPaired;
- (id)getLastNameUpdate;
- (id)getServices;
- (unsigned int)getClassOfDevice;

@end

@interface IOBluetoothPreferences : NSObject
{
    NSUserDefaults *bluetoothPrefs;
}

@property BOOL loggingEnabled;
@property BOOL autoSeekPointingDevice;
@property BOOL autoSeekKeyboard;
@property BOOL fileTransferServicesEnabled;
@property(readonly) NSDictionary *deviceCache;
@property(readonly) NSArray *pairedDevices;
@property(readonly) NSArray *configuredDevices;
- (void)removeFavoriteDevice:(id)arg1;
- (void)addFavoriteDevice:(id)arg1;
@property(readonly) NSArray *favoriteDevices;
@property BOOL remoteWakeEnabled;
@property BOOL discoverable;
@property BOOL isLocked;
- (void)_setPoweredOn:(BOOL)arg1;
@property BOOL poweredOn;

@end

@interface IOBluetoothHostController (Private)

+ (id)defaultController;
+ (id)controllers;
+ (void)enableNotifications;
- (id)nameAsString;
- (id)addressAsString;
- (int)getControllerManufacturerName;
- (int)getDiagnosticInfo;

@end
