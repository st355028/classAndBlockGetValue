//
//  motoInfo.m
//  classAndBlockGetValue
//
//  Created by MinYeh on 2016/8/8.
//  Copyright © 2016年 MINYEH. All rights reserved.
//

#import "motoInfo.h"

@implementation motoInfo


//使用NSUserDefault才需編碼解碼
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super init]){
        
        self.motoName = [aDecoder decodeObjectForKey:@"motoName"];
        self.motoPhone = [aDecoder decodeObjectForKey:@"motoPhone"];
        self.motoAddress = [aDecoder decodeObjectForKey:@"motoAddress"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.motoName forKey:@"motoName"];
    [aCoder encodeObject:self.motoPhone forKey:@"motoPhone"];
    [aCoder encodeObject:self.motoAddress forKey:@"motoAddress"];
}

@end
