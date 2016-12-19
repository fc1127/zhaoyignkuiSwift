

//ZYK0425
//
//  AFHttpRequest.m
//  KitchenProject
//
//  Created by 赵英奎 on 16/1/25.
//  Copyright © 2016年 KK. All rights reserved.
//

#import "AFHttpRequest.h"

@implementation AFHttpRequest
+(void)GET:(NSString *)url andSuccess:(SuccessBlock) success andFailed:(FailedBlock) failed
{
    //创建AFHttpRequest对象，实现AFNetWorking的二次封装
    AFHttpRequest *request=[[AFHttpRequest alloc]init];
    request.sblock=success;
    request.fblock=failed;
    
    request.manager=[AFHTTPRequestOperationManager manager];
    //关闭自动解析数据格式功能
    request.manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    //网络数据请求
    [request.manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //通过block实现传值
        request.sblock(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        request.fblock(error.localizedDescription);
    }];
    
    
}



+(void)POST:(NSString *)url andParams:(NSDictionary *)param andSuccess:(SuccessBlock )success andFailed:(FailedBlock )failed
{
    AFHttpRequest *request=[[AFHttpRequest alloc]init];
    request.sblock=success;
    request.fblock=failed;
    request.manager=[AFHTTPRequestOperationManager manager];
    request.manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    [request.manager POST:url parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
       
        request.sblock(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        request.fblock(error.localizedDescription);
        
    }];
}



@end




