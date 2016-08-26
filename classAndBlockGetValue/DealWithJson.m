//
//  DealWithJson.m
//  classAndBlockGetValue
//
//  Created by MinYeh on 2016/8/11.
//  Copyright © 2016年 MINYEH. All rights reserved.
//

#import "DealWithJson.h"
#import "motoInfo.h"

@implementation DealWithJson

//使用Block傳值回去的Method

//-(void)Connetion:(NSString*)URL andCallBlock:(Completion)completion{
//    
//    self.tmp = [NSMutableArray new];
//    
//    NSURL * url = [NSURL URLWithString:URL];
//    
//    NSURLSessionConfiguration * config = [NSURLSessionConfiguration defaultSessionConfiguration];
//    
//    NSURLSession * session = [NSURLSession sessionWithConfiguration:config];
//    
//    NSURLSessionDataTask * task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        
//        if(error){
//           
//            return ;
//        }
//        NSArray *jsonList = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//        
//       
//        for(int i=0;i<jsonList.count;i++){
//            motoInfo * moto = [motoInfo new];
//            
//            moto.motoName = jsonList[i][@"Title"];
//            moto.motoPhone = jsonList[i][@"Tel"];
//            moto.motoAddress = jsonList[i][@"Address"];
//            [self.tmp addObject:moto];
//        }
//        
//        completion(self.tmp);
//        
//    }];
//    [task resume];
//}


//使用NSUserDefault存值的Method
-(void)Connetion:(NSString*)URL andCountryToChoice:(NSString *)country{
    
    self.tmp = [NSMutableArray new];
    
    NSURL * url = [NSURL URLWithString:URL];
    
    NSURLSessionConfiguration * config = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession * session = [NSURLSession sessionWithConfiguration:config];
    
    NSURLSessionDataTask * task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if(error){
            
            return ;
        }
        NSArray *jsonList = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        
        for(int i=0;i<jsonList.count;i++){
            
            //每一筆類別物件都有相對應的店家資訊
            motoInfo * moto = [motoInfo new];
            
            moto.motoName = jsonList[i][@"Title"];
            moto.motoPhone = jsonList[i][@"Tel"];
            moto.motoAddress = jsonList[i][@"Address"];
            
            [self.tmp addObject:moto];
        }
        
        //編碼把存有類別物件的陣列進行編碼
        NSData * wantToSaveData = [NSKeyedArchiver archivedDataWithRootObject:self.tmp];
        
        [[NSUserDefaults standardUserDefaults]setObject:wantToSaveData forKey:[NSString stringWithFormat:@"%@",country]];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
    }];
    [task resume];
}


@end
