#MMUtility

**Objective C convenience methods to do miscellaneous tasks on iOS (and possibly Mac OS X)**

MMUtility contains various convenience methods to do various tasks on iOS. All methods are public and static. To use them, just 
call the method on the class (e.g. `[MMUtility trim:myString]`). Most of the methods do tedious tasks that I find myself doing 
frequently (like getting the application's documents directory.) Read the comments in `MMUtility.h` to see what it can do for 
you in more detail. I tried to give the methods descriptive names, so it almost documents itself. If you use this class in your
projects, it would be nice if you linked back to [this repo](https://github.com/mshmoustafa/MMUtility) :).

Here are the method comments in the `MMUtility.h`:

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

*Disclaimer:* I use `MMUtility` myself in my projects, but this class is in no way thoroughly tested. I claim no 
responsibility for anything that may go wrong. I've used this class in iOS 7+. This class may or may not work with iOS versions
older than iOS 7 (or any version for that matter - remember, I haven't thoroughly tested this code.)
