//
//  MMUtility.h
//
//
//  Created by Muhammad-Sharif Moustafa on 6/28/14.
//
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface MMUtility : NSObject

/*****************************************
 * Image Utilities
 * Methods included:
 *   - various scaling methods
 *   - encoding/decoding images as Base64
 *****************************************/

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSizePreservingAspectRatio:(CGSize)newSize;

+ (UIImage *)imageWithImage:(UIImage *)image scaledToWidth:(CGFloat)width;

+ (UIImage *)imageWithImage:(UIImage *)image scaledToHeight:(CGFloat)height;

+ (NSString *)encodeImageAsBase64:(UIImage *)image;

+ (UIImage *)decodeBase64AsImage:(NSString *)base64String;

/*****************************************
 * String Utilities
 * Methods included:
 *   - trim whitespace in an NSString
 *****************************************/

+ (NSMutableString *)trim:(NSString *)string;
+ (BOOL)stringIsEmpty:(NSString *)string;

/*****************************************
 * File System Utilities
 * Methods included:
 *   - get the application documents
 *     directory (on iOS, tested iOS 7+)
 *   - create an absolute path using the
 *     app documents directory and a
 *     relative path
 *   - check if a file exists
 *   - delete a file at a file path
 *****************************************/

+ (NSString *)applicationDocumentsDirectory;

+ (NSString *)absolutePathWithRelativePath:(NSString *)relativePath;

+ (BOOL)fileExists:(NSString *)file;

+ (BOOL)deleteFileAtFilePath:(NSString *)filePath;

/*****************************************
 * JSON Utilities
 * Methods included:
 *   - encode/decode a CLLocation as an
 *     NSDictionary
 *****************************************/

+ (NSDictionary *)JsonDictionaryFromLocation:(CLLocation *)location;

+ (CLLocation *)locationFromJsonDictionary:(NSDictionary *)dictionary;

/*****************************************
 * Date Utilities
 * Methods included:
 *   - serialize/deserialize an NSDate as
 *     an NSString
 *****************************************/

+ (NSString *)internationalStringFromDate:(NSDate *)date;

+ (NSDate *)dateFromInternationalString:(NSString *)string;

/*****************************************
 * Threading and Backgrounding Utilities
 * Methods included:
 *   - convenience methods to add a block
 *     to the default background thread
 *     and main thread
 *****************************************/
//
+ (void)addBlockToDefaultBackgroundThread:(void (^)(void))block;
+ (void)addBlockToMainThread:(void (^)(void))block;

/*****************************************
 * UIColor Utilities
 * Methods included:
 *   - get color components from a UIColor
 *****************************************/

+ (float)getRedFromUIColor:(UIColor *)color;
+ (float)getBlueFromUIColor:(UIColor *)color;
+ (float)getGreenFromUIColor:(UIColor *)color;
+ (float)getAlphaFromUIColor:(UIColor *)color;

@end
