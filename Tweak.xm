#import "Header.h"

BOOL noBlack = NO;
UIColor *overrideWhite = nil;

%hook _UIBackdropViewSettings

+ (_UIBackdropViewSettings *)settingsForStyle:(NSInteger)style graphicsQuality:(NSInteger)graphicsQuality {
	// L: 1000, 1003, 2020, 10090, 10100
	// D: 1001, 1100, 2030, 11050, 11060
	// L: 2029
	// D: 2039
	// L: 2010, 10050, 10060, 10070, 10080, 10110
	// D: 2050, 11070
	switch (style) {
		case 1000:
			style = 1001;
			break;
		case 1003:
			style = 1100;
			break;
		case 2010:
			style = 2050;
			break;
		case 2020:
			style = 2030;
			break;
		case 2029:
			style = 2039;
			break;
		case 10050:
		case 10060:
		case 10070:
		case 10080:
		case 10110:
			style = 11070;
			break;
		case 10090:
			style = 11050;
			break;
		case 10100:
			style = 11060;
			break;
	}
	return %orig(style, graphicsQuality);
}

%end

%hook UIViewController

- (UIUserInterfaceStyle)preferredUserInterfaceStyle {
	return UIUserInterfaceStyleDark;
}

%end

%hook UIView

- (NSInteger)_accessibilityResolvedInterfaceStyleForCurrentPreference {
	return 2;
}

%end

%hook UIColor

+ (UIColor *)tableBackgroundColor {
	onceColorWhite(0, 1);
}

+ (UIColor *)tableCellBackgroundColor {
	onceColor(@"tableCellBackgroundColor", 0, 0, 0, 1);
}

+ (UIColor *)tableCellPlainBackgroundColor {
	onceColor(@"tableCellPlainBackgroundColor", 0, 0, 0, 1);
}

+ (UIColor *)tableCellGroupedBackgroundColor {
	onceColor(@"tableCellGroupedBackgroundColor", 0.1098039215686274, 0.1098039215686274, 0.1176470588235294, 1.0);
}

+ (UIColor *)groupTableViewBackgroundColor {
	onceColorWhite(0, 1);
}

+ (UIColor *)separatorColor {
	onceColor(@"separatorColor", 0.3294117647058823, 0.3294117647058823, 0.3450980392156863, 0.6);
}

+ (UIColor *)tablePlainHeaderFooterFloatingBackgroundColor {
	onceColor(@"tablePlainHeaderFooterFloatingBackgroundColor", 0.196078431372549, 0.196078431372549, 0.203921568627451, 1.0);
}

+ (UIColor *)tablePlainHeaderFooterBackgroundColor {
	onceColor(@"tablePlainHeaderFooterBackgroundColor", 0.1411764705882353, 0.1411764705882353, 0.1607843137254902, 1.0);
}

+ (UIColor *)tableCellDefaultSelectionTintColor {
	onceColor(@"tableCellDefaultSelectionTintColor", 0.098039215686275, 0.098039215686275, 0.235294117647059, 1.0);
}

+ (UIColor *)systemBlueColor {
	// systemBlueColor
	onceColor(@"systemBlueColor", 0.0392156862745098, 0.5176470588235295, 1.0, 1.0);
}

+ (UIColor *)systemGrayColor {
	// systemGrayColor
	onceColor(@"systemGrayColor", 0.6823529411764706, 0.6823529411764706, 0.6980392156862745, 1.0);
}

%new
+ (UIColor *)systemGray4Color {
	onceColor(@"systemGray4", 0.2274509803921569, 0.2274509803921569, 0.2352941176470588, 1.0);
}

%new
+ (UIColor *)systemGray6Color {
	onceColor(@"systemGray6", 0.1098039215686274, 0.1098039215686274, 0.1176470588235294, 1.0);
}

+ (UIColor *)blackColor {
	return noBlack ? [self labelColor] : %orig;
}

+ (UIColor *)whiteColor {
	return overrideWhite ? overrideWhite : %orig;
}

%new
+ (UIColor *)labelColor {
	onceColor(@"labelColor", 1, 1, 1, 1);
}

%new
+ (UIColor *)_groupTableHeaderFooterTextColor {
	onceColor(@"groupTableHeaderFooterTextColor", 0.5568627450980392, 0.5568627450980392, 0.5764705882352941, 1.0);
}

%new
+ (UIColor *)_plainTableHeaderFooterTextColor {
	onceColor(@"plainTableHeaderFooterTextColor", 0.8627450980392157, 0.8627450980392157, 0.8627450980392157, 1.0);
}

%new
+ (UIColor *)systemBackgroundColor {
	onceColorWhite(0, 1);
}

%new
+ (UIColor *)secondarySystemBackgroundColor {
	onceColor(@"secondarySystemBackground", 0.1098039215686274, 0.1098039215686274, 0.1176470588235294, 1.0);
}

%new
+ (UIColor *)systemGroupedBackgroundColor {
	onceColorWhite(0, 1);
}

%new
+ (UIColor *)secondarySystemGroupedBackgroundColor {
	// secondarySystemGroupedBackground
	onceColor(@"secondarySystemGroupedBackground", 0.1098039215686274, 0.1098039215686274, 0.1176470588235294, 1.0);
}

%new
+ (UIColor *)secondaryLabelColor {
	// secondaryLabel
	onceColor(@"secondaryLabel", 0.9215686274509803, 0.9215686274509803, 0.9607843137254902, 0.6);
}

%new
+ (UIColor *)tertiaryLabelColor {
	// tertiaryLabel
	onceColor(@"tertiaryLabel", 0.9215686274509803, 0.9215686274509803, 0.9607843137254902, 0.3);
}

%new
+ (UIColor *)quaternaryLabelColor {
	// quaternaryLabel
	onceColor(@"quaternaryLabel", 0.9215686274509803, 0.9215686274509803, 0.9607843137254902, 0.18);
}

%new
+ (UIColor *)_controlForegroundColor {
	onceColor(@"controlForeground", 0.9215686274509803, 0.9215686274509803, 0.9607843137254902, 0.3);
}

%new
+ (UIColor *)_searchBarBackgroundColor {
	onceColor(@"searchBarBackgroundColor", 0.5450980392156862, 0.5450980392156862, 0.5607843137254902, 1.0);
}

%new
+ (UIColor *)_textFieldBackgroundColor {
	onceColorWhite(0, 1);
}

%new
+ (UIColor *)_textFieldDisabledBackgroundColor {
	onceColorWhite(0.0196078431372549, 1.0);
}

%end

%hook UIButtonLabel

- (id)_defaultAttributes {
	noBlack = YES;
	id ret = %orig;
	noBlack = NO;
	return ret;
}

%end

%hook _UINavigationBarVisualProviderModernIOS

- (NSDictionary *)_defaultTitleAttributes {
	withForegroundColor(%orig);
}

%end

%hook UILabel

+ (NSDictionary *)_defaultAttributes {
	NSDictionary *defaultAttrs = %orig;
	if (defaultAttrs) {
		NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
		[attrs addEntriesFromDictionary:defaultAttrs];
		attrs[NSForegroundColorAttributeName] = [UIColor labelColor];
		return attrs;
	}
	return defaultAttrs;
}

- (void)_setTextColor:(UIColor *)color {
	%orig(color ? color : [UIColor labelColor]);
}

- (UIColor *)textColor {
	noBlack = YES;
	UIColor *color = %orig;
	noBlack = NO;
	return color;
}

- (UIColor *)currentTextColor {
	noBlack = YES;
	UIColor *color = %orig;
	noBlack = NO;
	return color;
}

- (void)_commonInit {
	%orig;
	self.textColor = [UIColor labelColor];
}

%end

%hook _UILabelVisualStyle_iOS

- (BOOL)supportsUserInterfaceStyle {
	return YES;
}

%end

%hook _UIAtomTextView

+ (UIColor *)defaultTextColor {
	return [UIColor labelColor];
}

%end

%hook UIApplication

- (UIUserInterfaceStyle)_effectiveUserInterfaceStyle {
	return UIUserInterfaceStyleDark;
}

%end

%hook UITableConstants_IOS

- (BOOL)supportsUserInterfaceStyles {
	return YES;
}

- (UIColor *)defaultTextColorForCell:(UITableViewCell *)cell inTableView:(UITableView *)tableView {
	if (cell.style != UITableViewCellStyleValue2) {
		return [UIColor labelColor];
	}
	return %orig;
}

- (UIColor *)defaultDetailTextColorForCell:(UITableViewCell *)cell inTableView:(UITableView *)tableView {
	return cell.style == UITableViewCellStyleValue1 ? [UIColor systemGrayColor] : [UIColor labelColor];
}

- (UIColor *)defaultHeaderTextColorForTableViewStyle:(UITableViewStyle)style {
	return style ? [UIColor _groupTableHeaderFooterTextColor] : [UIColor _plainTableHeaderFooterTextColor];
}

// tvOS style
%new
- (UIColor *)defaultHeaderTextColorForTableViewStyle:(UITableViewStyle)style userInterfaceStyle:(UIUserInterfaceStyle)userInterfaceStyle {
	return style ? [UIColor _groupTableHeaderFooterTextColor] : [UIColor _plainTableHeaderFooterTextColor];
}

- (UIColor *)defaultFooterTextColorForTableViewStyle:(UITableViewStyle)style {
	return style ? [UIColor _groupTableHeaderFooterTextColor] : [UIColor _plainTableHeaderFooterTextColor];
}

- (UIColor *)defaultBackgroundColorForTableViewStyle:(UITableViewStyle)style {
	return style ? [UIColor systemGroupedBackgroundColor] : [UIColor tableBackgroundColor];
}

%new
- (UIColor *)defaultHeaderFooterBackgroundColorForView:(UITableViewHeaderFooterView *)view inTableView:(UITableView *)tableView {
	if ([view floating]) {
		return [UIColor tablePlainHeaderFooterFloatingBackgroundColor];
	}
	return [UIColor tablePlainHeaderFooterBackgroundColor];
}

- (UIColor *)defaultHeaderBackgroundColorForView:(UITableViewHeaderFooterView *)view inTableView:(UITableView *)tableView {
	return [self defaultHeaderFooterBackgroundColorForView:view inTableView:tableView];
}

- (UIColor *)defaultFooterBackgroundColorForView:(UITableViewHeaderFooterView *)view inTableView:(UITableView *)tableView {
	return [self defaultHeaderFooterBackgroundColorForView:view inTableView:tableView];
}

%end

%hook _UITextFieldVisualStyle_iOS

- (UIColor *)defaultTextColor {
	return [UIColor labelColor];
}

- (UIColor *)defaultTextColorForKeyboardAppearance {
	return [UIColor labelColor];
}

- (UIColor *)placeholderColor {
	return [UIColor tertiaryLabelColor];
}

%end

%hook _UITextViewVisualStyle_iOS

- (UIColor *)backgroundColor {
	return [UIColor systemBackgroundColor];
}

%end

%hook _UITextFieldRoundedRectBackgroundViewNeue

- (UIColor *)_fillColor:(BOOL)arg1 {
	return arg1 ? [UIColor _textFieldBackgroundColor] : [UIColor _textFieldDisabledBackgroundColor];
}

%end

%hook _UIAlertControlleriOSActionSheetCancelBackgroundView

- (id)initWithFrame:(CGRect)frame {
	self = %orig;
	if (self) {
		self.backgroundColor = [UIColor secondarySystemGroupedBackgroundColor];
		((UIView *)[self valueForKey:@"backgroundView"]).backgroundColor = [UIColor secondarySystemGroupedBackgroundColor];
	}
	return self;
}

%end

%hook UIRefreshControl

+ (UIColor *)_defaultColor {
	return [UIColor secondaryLabelColor];
}

%end

%hook UIActivityIndicatorView

- (UIColor *)_defaultColorForStyle:(UIActivityIndicatorViewStyle)style {
	overrideWhite = [UIColor secondaryLabelColor];
	UIColor *color = %orig;
	overrideWhite = nil;
	return color;
}

%end

%hook UIAlertControllerVisualStyle

- (UIColor *)titleLabelColor {
	return [UIColor labelColor];
}

- (UIColor *)messageLabelColor {
	return [self titleLabelColor];
}

%end

%hook UIAlertControllerVisualStyleAlert

- (UIColor *)titleLabelColor {
	return [UIColor labelColor];
}

%end

%hook _UIRefreshControlModernContentView

- (UIColor *)_effectiveTintColor {
	UIColor *tintColor = self.tintColor;
	return tintColor ? tintColor : [UIColor labelColor];
}

%end

%hook UIInterfaceActionConcreteVisualStyle

- (UIColor *)actionTitleLabelColorForViewState:(id)state {
	return [UIColor labelColor];
}

%end

%hook _UIPreviewPresentationController

- (void)_configureActionSheetChromeViews {
	overrideWhite = [UIColor _controlForegroundColor];
	%orig;
	overrideWhite = nil;
}

%end

%hook UITableViewCell

- (UIColor *)_multiselectBackgroundColor {
	return [UIColor systemGray6Color];
}

- (UIColor *)_contentBackgroundColor {
	return [self backgroundColor];
}

%end

%hook UISearchBar

- (UIColor *)_colorForComponent:(NSUInteger)component disabled:(BOOL)disabled {
	noBlack = YES;
	UIColor *color = %orig;
	noBlack = NO;
	return color;
}

%end

/*%hook UIStatusBarNewUIStyleAttributes

- (id)initWithRequest:(UIStatusBarStyleRequest *)request backgroundColor:(UIColor *)backgroundColor foregroundColor:(UIColor *)foregroundColor hasBusyBackground:(BOOL)busy {
	return %orig(request, backgroundColor, [UIColor labelColor], busy);
}

%end*/

%hook _UINavigationBarVisualStyle

- (UIColor *)defaultTitleColorForUserInterfaceStyle:(NSInteger)userInterfaceStyle barStyle:(NSInteger)barStyle {
	return [UIColor labelColor]; // unlike iOS 13
}

%end

%hook UIStatusBar

+ (UIStatusBarNewUIStyleAttributes *)_newStyleAttributesForRequest:(UIStatusBarStyleRequest *)request {
	UIColor *requestForegroundColor = [request valueForKey:@"_foregroundColor"];
	if (requestForegroundColor) {
		[request setValue:[UIColor labelColor] forKey:@"_foregroundColor"];
	}
	UIStatusBarNewUIStyleAttributes *attrs = %orig(request);
	UIColor *foregroundColor = [attrs valueForKey:@"_foregroundColor"];
	if (foregroundColor) {
		[attrs setValue:[UIColor labelColor] forKey:@"_foregroundColor"];
	}
	return attrs;
}

%end

%hook UITextInputTraits

- (UIKeyboardAppearance)keyboardAppearance {
	return UIKeyboardAppearanceDark;
}

%end

%hookf(UIColor *, "__barBackgroundFillColor", NSInteger arg1, id arg2) {
	return !arg1 && !arg2 ? [UIColor _searchBarBackgroundColor] : %orig(arg1, arg2);
}

%ctor {
	%init;
}