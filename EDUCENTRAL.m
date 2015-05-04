//
//  EDUCENTRAL.m
//  EDUAPP
//
//  Created by Nathanial Larson on 4/23/15.
//  Copyright (c) 2015 Nathanial Larson. All rights reserved.
//

#import "EDUCENTRAL.h"

@interface EDUCENTRAL ()

@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;

@end

@implementation EDUCENTRAL

- (NSPersistentStoreCoordinator *)CENTRALPSC
{
    if (_CENTRALPSC != nil) {
        return _CENTRALPSC;
    }
    
    _CENTRALPSC = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSString *path = [self appDocDirectory];
    NSURL *central = [NSURL fileURLWithPath:path];
    NSError *error;
    
    if (![_CENTRALPSC addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:central options:nil error:&error]) {
        @throw [NSException exceptionWithName:@"Open Failure" reason:[error localizedDescription] userInfo:nil];
    }
    return _CENTRALPSC;
}

- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    _managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    return _managedObjectModel;
}

- (NSString *)appDocDirectory
{
    NSArray *docDirecs = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *directory = [docDirecs firstObject];
    return [directory stringByAppendingPathComponent:@"EDUAPP.data"];
}

+ (EDUCENTRAL *)CENTRALSTATION
{
    static EDUCENTRAL *CENTRALSTATION = nil;
    
    if (!CENTRALSTATION) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            CENTRALSTATION = [[self alloc] initPrivate];
        });
    }
    return CENTRALSTATION;
}

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use Central Station" userInfo:nil];
    return nil;
}

- (instancetype)initPrivate
{
    self = [super init];
    return self;
}

@end
