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

//Image Utilities
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSizePreservingAspectRatio:(CGSize)newSize;

+ (UIImage *)imageWithImage:(UIImage *)image scaledToWidth:(CGFloat)width;

+ (UIImage *)imageWithImage:(UIImage *)image scaledToHeight:(CGFloat)height;

+ (NSString *)encodeImageAsBase64:(UIImage *)image;

+ (UIImage *)decodeBase64AsImage:(NSString *)base64String;

//String Utilities
+ (NSMutableString *)trim:(NSString *)string;

//File System Utilities
+ (NSString *)applicationDocumentsDirectory;

+ (NSString *)absolutePathWithRelativePath:(NSString *)relativePath;

+ (BOOL)fileExists:(NSString *)file;

+ (BOOL)deleteFileAtFilePath:(NSString *)filePath;

//JSON Utilities
+ (NSDictionary *)JsonDictionaryFromLocation:(CLLocation *)location;

+ (CLLocation *)locationFromJsonDictionary:(NSDictionary *)dictionary;

//Date Utilities
+ (NSString *)internationalStringFromDate:(NSDate *)date;

+ (NSDate *)dateFromInternationalString:(NSString *)string;

//Threading and Backgrounding Utilities
+ (void)addBlockToDefaultBackgroundThread:(void (^)(void))block;
+ (void)addBlockToMainThread:(void (^)(void))block;

//UIColor Utilities
+ (float)getRedFromUIColor:(UIColor *)color;
+ (float)getBlueFromUIColor:(UIColor *)color;
+ (float)getGreenFromUIColor:(UIColor *)color;
+ (float)getAlphaFromUIColor:(UIColor *)color;

@end
