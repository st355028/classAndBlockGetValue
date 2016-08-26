//
//  DealWithJson.h
//  classAndBlockGetValue
//
//  Created by MinYeh on 2016/8/11.
//  Copyright © 2016年 MINYEH. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Completion)(NSArray* youWantToSave);


@interface DealWithJson : NSObject

@property NSMutableArray * tmp;
//-(void)Connetion:(NSString*)URL andCallBlock:(Completion)completion;
-(void)Connetion:(NSString*)URL andCountryToChoice:(NSString *)country;

@end
