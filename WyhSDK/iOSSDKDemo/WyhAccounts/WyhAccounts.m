//
//  WyhAccounts.m
//  WyhSDK
//
//  Created by 王乙涵 on 2017/10/30.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import "WyhAccounts.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>
@implementation WyhAccounts
+(void)sendSocialRequest{
    ACAccountStore *account = [ACAccountStore new];
    ACAccountType *type = [account accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierSinaWeibo];
    [account requestAccessToAccountsWithType:type options:nil completion:^(BOOL granted, NSError *error) {
        if (granted) {
            NSArray *array = [account accountsWithAccountType:type];
            NSLog(@"%@",array);
            if (array.count>0) {
                SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeSinaWeibo requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:@"https://api.weibo.com/2/common/get_city.json"] parameters:[NSDictionary dictionaryWithObjects:@[@"001011"] forKeys:@[@"province"]]];
                request.account = [array objectAtIndex:0];
                [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
                    NSError *err = nil;
                    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&err];
                    if (!err) {
                        NSLog(@"%@",dic);
                    }
                }];
            }
        }else{
            NSLog(@"%@",error);
        }
    }];
}
@end
