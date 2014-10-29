# MMUtility
## Brief Overview

**This might not be completely up to date. To read about the latest features, read the comments in `MMUtility.h`.

* Image Utilities
  * Methods included:
    * various scaling methods
    * encoding/decoding images as Base64
* String Utilities
  * Methods included:
    * trim whitespace in an NSString
* File System Utilities
  * Methods included:
    * get the application documents directory (on iOS, tested iOS 7<)
    * create an absolute path using the app documents directory and a relative path
    * check if a file exists
    * delete a file at a file path
* JSON Utilities
  * Methods included:
    * encode/decode a CLLocation as an NSDictionary
* Date Utilities
  * Methods included:
    * serialize/deserialize an NSDate as an NSString
* Threading and Backgrounding Utilities
  * Methods included:
    * convenience methods to add a block to the default background thread and main thread
* UIColor Utilities
  * Methods included:
    * get color components from a UIColor
