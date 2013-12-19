//
//  UIDevice+Machine.m
//  TerminalVelocity
//
//  Created by Aaron Jones on 11/25/11.
//  Copyright (c) 2011 Dark Energy Studios. All rights reserved.
//

#import "UIDevice+Machine.h"
#import <stdlib.h>
#include <sys/sysctl.h>

@implementation UIDevice (Machine)

-(NSString *)machine{
    size_t size;
    
    // Set 'oldp' parameter to NULL to get the size of the data
    // returned so we can allocate appropriate amount of space
    sysctlbyname("hw.machine", NULL, &size, NULL, 0); 
    
    // Allocate the space to store name
    char *name = malloc(size);
    
    // Get the platform name
    sysctlbyname("hw.machine", name, &size, NULL, 0);
    
    // Place name into a string
    NSString *machine = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
    
    // Done with this
    free(name);
    
    return machine;
}
@end