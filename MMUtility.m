//
//  MMUtility.m
//
//
//  Created by Muhammad-Sharif Moustafa on 6/28/14.
//
//

//#define DATEFORMAT @"yyyy-MM-dd HH:mm:ss ZZZZ";

#import "MMUtility.h"
#import <CoreLocation/CoreLocation.h>

@implementation MMUtility

// adapted from Paul Lynch's response to this question on StackOverflow
// http://stackoverflow.com/questions/2658738/the-simplest-way-to-resize-an-uiimage
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSizePreservingAspectRatio:(CGSize)newSize {

    CGSize originalSize = image.size;

    CGFloat widthDiff = abs( originalSize.width - newSize.width );
    CGFloat heightDiff = abs( originalSize.height - newSize.height );

    if (widthDiff < heightDiff) {
        return [MMUtility imageWithImage:image scaledToWidth:newSize.width];
    } else {
        return [MMUtility imageWithImage:image scaledToHeight:newSize.height];
    }

}

+ (UIImage *)imageWithImage:(UIImage *)image scaledToWidth:(CGFloat)width {

    //scale height by same factor as width
    CGFloat originalWidth = image.size.width;
    CGFloat scalingFactor = width / originalWidth;

    CGFloat scaledHeight = image.size.height * scalingFactor;

    CGSize newSize = CGSizeMake(width, scaledHeight);

    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);

    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)imageWithImage:(UIImage *)image scaledToHeight:(CGFloat)height {

    //scale height by same factor as width
    CGFloat originalHeight = image.size.height;
    CGFloat scalingFactor = height / originalHeight;

    CGFloat scaledWidth = image.size.width * scalingFactor;

    CGSize newSize = CGSizeMake(scaledWidth, height);

    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);

    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (NSMutableString *)trim:(NSString *)string {
    NSMutableString *trimmedString = [string stringByTrimmingCharactersInSet:
                               [NSCharacterSet whitespaceCharacterSet]];
    return trimmedString;
}

+ (NSString *)applicationDocumentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
}

+ (NSString *)absolutePathWithRelativePath:(NSString *)relativePath
{
    if (relativePath) {
    return [NSString stringWithFormat:@"%@/%@", [MMUtility applicationDocumentsDirectory], relativePath];
    }
    return [MMUtility applicationDocumentsDirectory];
}

+ (BOOL)fileExists:(NSString *)file
{
    return [[NSFileManager defaultManager] fileExistsAtPath:file];
}

+ (BOOL)deleteFileAtFilePath:(NSString *)filePath
{
    NSFileManager *fileManager = [NSFileManager defaultManager];

    NSError *error;
    return [fileManager removeItemAtPath:filePath error:&error];
}

+ (NSString *)encodeImageAsBase64:(UIImage *)image
{
    return [UIImageJPEGRepresentation(image, 1.0) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}

+ (UIImage *)decodeBase64AsImage:(NSString *)base64String
{
    if (base64String) {
        NSData *data = [[NSData alloc]initWithBase64EncodedString:base64String options:NSDataBase64DecodingIgnoreUnknownCharacters];
        return [UIImage imageWithData:data];
    }

    return nil;
}

+ (NSDictionary *)JsonDictionaryFromLocation:(CLLocation *)location
{
    NSNumber *longitude = [NSNumber numberWithDouble:location.coordinate.longitude];
    NSNumber *latitude = [NSNumber numberWithDouble:location.coordinate.latitude];
    NSDictionary *dictionary = @{@"longitude" : longitude,
                                 @"latitude" : latitude,
                                 @"altitude" : [NSNumber numberWithDouble:location.altitude],
                                 @"horizontalAccuracy" : [NSNumber numberWithDouble:location.horizontalAccuracy],
                                 @"verticalAccuracy" : [NSNumber numberWithDouble:location.verticalAccuracy],
                                 @"course" : [NSNumber numberWithDouble:location.course],
                                 @"speed" : [NSNumber numberWithDouble:location.speed],
                                 @"timestamp" : [MMUtility internationalStringFromDate:location.timestamp]
                                 };

    return dictionary;
}

+ (CLLocation *)locationFromJsonDictionary:(NSDictionary *)dictionary
{
    CLLocationDegrees latitude = [((NSNumber *)dictionary[@"latitude"]) doubleValue];
    CLLocationDegrees longitude = [((NSNumber *)dictionary[@"longitude"]) doubleValue];
    CLLocationDistance altitude = [((NSNumber *)dictionary[@"altitude"]) doubleValue];
    CLLocationAccuracy horizontalAccuracy = [((NSNumber *)dictionary[@"horizontalAccuracy"]) doubleValue];
    CLLocationAccuracy verticalAccuracy = [((NSNumber *)dictionary[@"verticalAccuracy"]) doubleValue];
    CLLocationDirection course = [((NSNumber *)dictionary[@"course"]) doubleValue];
    CLLocationSpeed speed = [((NSNumber *)dictionary[@"speed"]) doubleValue];
    NSDate *timestamp = [MMUtility dateFromInternationalString:dictionary[@"timestamp"]];

    return [[CLLocation alloc] initWithCoordinate:CLLocationCoordinate2DMake(latitude, longitude)
                                         altitude:altitude
                               horizontalAccuracy:horizontalAccuracy
                                 verticalAccuracy:verticalAccuracy
                                           course:course
                                            speed:speed
                                        timestamp:timestamp];
}

+ (NSString *)internationalStringFromDate:(NSDate *)date
{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss ZZZZ"];
    NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];

    return dateString;
}

+ (NSDate *)dateFromInternationalString:(NSString *)string
{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss ZZZZ"];

    NSDate *date = [dateFormatter dateFromString:string];

    return date;
}

+ (void)addBlockToDefaultBackgroundThread:(void (^)(void))block
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
}

+ (void)addBlockToMainThread:(void (^)(void))block
{
    dispatch_async(dispatch_get_main_queue(), block);
}

+ (float)getRedFromUIColor:(UIColor *)color {
    return CGColorGetComponents(color.CGColor)[0];
}

+ (float)getGreenFromUIColor:(UIColor *)color {
    return CGColorGetComponents(color.CGColor)[1];
}

+ (float)getBlueFromUIColor:(UIColor *)color {
    return CGColorGetComponents(color.CGColor)[2];
}

+ (float)getAlphaFromUIColor:(UIColor *)color {
    return CGColorGetComponents(color.CGColor)[3];
}

@end
