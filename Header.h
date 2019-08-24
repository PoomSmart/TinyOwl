#ifndef _TINYOWL_H
#define _TINYOWL_H

#import "../PS.h"
#import <UIKit/UIColor+Private.h>

@interface UIColor (MyPrivate)
@property (getter=_systemColorName, setter=_setSystemColorName:, nonatomic, retain) NSString *systemColorName;
@end

@interface UIColor (TO)
+ (UIColor *)labelColor;
+ (UIColor *)secondaryLabelColor;
+ (UIColor *)tertiaryLabelColor;
+ (UIColor *)quaternaryLabelColor;
+ (UIColor *)systemBackgroundColor;
+ (UIColor *)systemGray4Color;
+ (UIColor *)systemGray6Color;
+ (UIColor *)secondarySystemBackgroundColor;
+ (UIColor *)systemGroupedBackgroundColor;
+ (UIColor *)secondarySystemGroupedBackgroundColor;
+ (UIColor *)tableBackgroundColor;
+ (UIColor *)_controlForegroundColor;
+ (UIColor *)_textFieldBackgroundColor;
+ (UIColor *)_textFieldDisabledBackgroundColor;
+ (UIColor *)_groupTableHeaderFooterTextColor;
+ (UIColor *)_plainTableHeaderFooterTextColor;
+ (UIColor *)_searchBarBackgroundColor;
@end

@interface UITableViewCell (Private)
- (UITableViewCellStyle)style;
@end

@interface UITableViewHeaderFooterView (Private)
- (bool)floating;
@end

@interface UITableConstants_IOS : NSObject
- (UIColor *)defaultHeaderFooterBackgroundColorForView:(UITableViewHeaderFooterView *)view inTableView:(UITableView *)tableView;
@end

@interface UIDeviceRGBColor : UIColor
@end

@interface UICachedDeviceRGBColor : UIDeviceRGBColor
@end

@interface UIDeviceWhiteColor : UIColor
@end

@interface UICachedDeviceWhiteColor : UIDeviceWhiteColor
@end

@interface UIAlertControllerVisualStyle : NSObject
- (UIColor *)titleLabelColor;
@end

@interface _UIRefreshControlModernContentView : UIView
@end

@interface _UIAlertControlleriOSActionSheetCancelBackgroundView : UIView
@end

@interface UIStatusBarStyleRequest : NSObject
@end

@interface UIStatusBarNewUIStyleAttributes : NSObject
@end

#define onceColor(colorName, r, g, b, a) \
	static UIColor *color = nil; \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        color = [[objc_getClass("UICachedDeviceRGBColor") alloc] initWithRed:r green:g blue:b alpha:a]; \
		[color _setSystemColorName:colorName]; \
    }); \
    return color

#define onceColorWhite(w, a) \
	static UIColor *color = nil; \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        color = [[objc_getClass("UICachedDeviceWhiteColor") alloc] initWithWhite:w alpha:a]; \
    }); \
    return color

#define withForegroundColor(dict) \
    NSDictionary *defaultAttrs = dict; \
	if (defaultAttrs) { \
		NSMutableDictionary *attrs = [NSMutableDictionary dictionary]; \
		[attrs addEntriesFromDictionary:defaultAttrs]; \
		attrs[NSForegroundColorAttributeName] = [UIColor labelColor]; \
		return attrs; \
	} \
	return defaultAttrs

#endif