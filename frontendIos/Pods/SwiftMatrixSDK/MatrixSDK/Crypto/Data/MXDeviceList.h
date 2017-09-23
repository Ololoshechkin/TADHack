/*
 Copyright 2017 Vector Creations Ltd

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import <Foundation/Foundation.h>

#import "MXSDKOptions.h"

#ifdef MX_CRYPTO

#import "MXDeviceInfo.h"
#import "MXCryptoConstants.h"

#import "MXRestClient.h"

@class MXCrypto;

// Constants for DeviceList.deviceTrackingStatus
typedef enum : NSUInteger
{
    MXDeviceTrackingStatusNotTracked = 0,
    MXDeviceTrackingStatusPendingDownload,
    MXDeviceTrackingStatusDownloadInProgress,
    MXDeviceTrackingStatusUnreachableServer,
    MXDeviceTrackingStatusUpToDate

} MXDeviceTrackingStatus;

// Helper to transform a NSNumber stored in a NSDictionary to MXDeviceTrackingStatus
#define MXDeviceTrackingStatusFromNSNumber(aNSNumberObject) ((MXDeviceTrackingStatus)[aNSNumberObject integerValue])


/**
 `MXDeviceList` manages the list of other users' devices.
 */
@interface MXDeviceList : NSObject

/**
 The last sync token.
 */
@property (nonatomic) NSString *lastKnownSyncToken;

/**
 Constructor.
 
 @param crypto the MXCrypto instance.
 @return a new MXDeviceList instance.
 */
- (id)initWithCrypto:(MXCrypto*)crypto;

/**
 Download the device keys for a list of users and stores the keys in the MXStore.

 @param userIds The users to fetch.
 @param forceDownload Always download the keys even if cached.

 @param success A block object called when the operation succeeds.
 @param failure A block object called when the operation fails.

 @return a MXHTTPOperation instance. May be nil if the data is already in the store.
 */
- (MXHTTPOperation*)downloadKeys:(NSArray<NSString*>*)userIds forceDownload:(BOOL)forceDownload
                         success:(void (^)(MXUsersDevicesMap<MXDeviceInfo*> *usersDevicesInfoMap))success
                         failure:(void (^)(NSError *error))failure;

/**
 Get the stored device keys for a user.

 @param userId the user to list keys for.
 @return the list of devices.
 */
- (NSArray<MXDeviceInfo*>*)storedDevicesForUser:(NSString*)userId;

/**
 Find a device by curve25519 identity key

 @param userId the owner of the device.
 @param algorithm the encryption algorithm.
 @param senderKey the curve25519 key to match.
 @return the device info.
 */
- (MXDeviceInfo*)deviceWithIdentityKey:(NSString*)senderKey forUser:(NSString*)userId andAlgorithm:(NSString*)algorithm;

/**
 Flag the given user for device-list tracking, if they are not already.
 
 This will mean that a subsequent call to refreshOutdatedDeviceLists
 will download the device list for the user, and that subsequent calls to
 invalidateUserDeviceList will trigger more updates.
 
 @param userId the user to start to track devices.
 */
- (void)startTrackingDeviceList:(NSString*)userId;

/**
 Mark the cached device list for the given user outdated.
 
 If we are not tracking this user's devices, we'll do nothing. Otherwise
 we flag the user as needing an update.

 This doesn't set off an update, so that several users can be batched
 together. Call refreshOutdatedDeviceLists for that.

 @param userId the user whose devices must be invalidated.
 */
- (void)invalidateUserDeviceList:(NSString*)userId;

/**
 Mark all tracked device lists as outdated.
 
 This will flag each user whose devices we are tracking as in need of an
 update.
 */
- (void)invalidateAllDeviceLists;

/**
 If we have users who have outdated device lists, start key downloads for them.
 */
- (void)refreshOutdatedDeviceLists;

@end

#endif
