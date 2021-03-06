// Copyright 2014-2015 BigML
//
// Licensed under the Apache License, Version 2.0 (the "License"); you may
// not use this file except in compliance with the License. You may obtain
// a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
// WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
// License for the specific language governing permissions and limitations
// under the License.

#import "BMLWorkflowConfigurator.h"
#import "BMLWorkflowTaskConfiguration.h"
#import "BMLWorkflowTask.h"

//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
@implementation BMLWorkflowConfigurator

//////////////////////////////////////////////////////////////////////////////////////
- (instancetype)init {
 
    if (self = [super init]) {
        _taskConfigurations = [NSMutableDictionary new];
    }
    return self;
}

//////////////////////////////////////////////////////////////////////////////////////
- (BMLWorkflowTaskConfiguration*)configurationForResourceType:(BMLResourceType*)resourceType {
    
    if (!_taskConfigurations[resourceType]) {
        NSString* plistName = [BMLWorkflowTaskConfiguration configurationPlistForResourceType:resourceType];
        BMLWorkflowTaskConfiguration* configuration = [[BMLWorkflowTaskConfiguration alloc] initWithPList:plistName];
        if (configuration)
            _taskConfigurations[resourceType] = configuration;
    }
    return _taskConfigurations[resourceType];
}

@end
