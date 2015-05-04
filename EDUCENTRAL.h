//
//  EDUCENTRAL.h
//  EDUAPP
//
//  Created by Nathanial Larson on 4/23/15.
//  Copyright (c) 2015 Nathanial Larson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Credentials.h"

@interface EDUCENTRAL : NSObject

+ (EDUCENTRAL *)CENTRALSTATION;

@property (nonatomic, strong) NSPersistentStoreCoordinator *CENTRALPSC;

@end
