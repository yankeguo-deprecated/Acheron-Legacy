//
//  AcheronUI.h
//  Pods
//
//  Created by YANKE Guo on 14-5-8.
//
//

#import "UINavigationItem+NIBFix.h"

#pragma mark - Quick Resource Loader

#define LoadNIB(NAME)   [UINib nibWithNibName:@#NAME bundle:nil]
#define LoadSB(NAME)    [UIStoryboard storyboardWithName:@#NAME bundle:nil]
#define LoadImage(NAME) [UIImage imageNamed:@#NAME]