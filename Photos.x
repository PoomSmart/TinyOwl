#import "Header.h"

@interface PXGadgetViewController : UIViewController
@end

%hook PUFlatWhiteInterfaceTheme

- (UIColor *)photoCollectionViewBackgroundColor {
    return [UIColor systemBackgroundColor];
}

- (UIColor *)airPlayVideoPlaceholderTitleTextColor {
    return [UIColor labelColor];
}

- (UIColor *)photoBrowserTitleViewTextColor {
    return [UIColor labelColor];
}

- (UIColor *)searchTitleTextColor {
    return [UIColor labelColor];
}

- (UIColor *)tintColorForBarStyle:(NSInteger)style {
    return [UIColor labelColor];
}

- (void)configureAlbumListTitleLabel:(UILabel *)label asOpaque:(bool)opaque {
    %orig(label, NO);
    label.textColor = [UIColor labelColor];
}

- (void)configurePhotoCollectionHeaderTitleLabel:(UILabel *)label forStyle:(NSInteger)style {
    %orig;
    label.textColor = [UIColor labelColor];
}

- (void)_configurePhotoCollectionGlobalFooterLabel:(UILabel *)label withFontDescriptor:(id)fontDescriptor textColor:(UIColor *)textColor {
    %orig(label, fontDescriptor, [UIColor labelColor]);
}

- (NSDictionary *)sectionHeaderNotTappableTextAttributes {
    withForegroundColor(%orig);
}

- (NSDictionary *)textBlockBelowArtTitleTextAttributes {
    withForegroundColor(%orig);
}

- (NSDictionary *)textBlockBelowArtTitleEmphasizedTextAttributes {
    withForegroundColor(%orig);
}

%end

%hook PXGadgetViewController

- (id)initWithLayout:(id)layout dataSourceManager:(id)data {
    self = %orig;
    [self setValue:[UIColor systemBackgroundColor] forKey:@"_backgroundColor"];
    return self;
}

%end

%hook PXGadgetSectionHeaderView

- (UILabel *)titleLabel {
    UILabel *label = %orig;
    label.backgroundColor = [UIColor clearColor];
    return label;
}

%end

%hook PXUIBadgeTheme

- (UIColor *)labelTextColor {
    return [UIColor labelColor];
}

%end

%ctor {
    NSLog(@"TinyOwl Photos init");
    %init;
}