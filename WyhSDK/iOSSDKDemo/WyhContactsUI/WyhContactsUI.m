//
//  WyhContactsUI.m
//  WyhSDK
//
//  Created by 王乙涵 on 2017/10/31.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import "WyhContactsUI.h"

#import <ContactsUI/ContactsUI.h>
@interface WyhContactsUI ()<CNContactPickerDelegate>
@end
@implementation WyhContactsUI
+(void)getContacts:(UIViewController *)vc{
    
    CNContactPickerViewController *contactvc = [CNContactPickerViewController new];
    contactvc.delegate = self;
    [vc presentViewController:contactvc animated:YES completion:nil];
    
}

@end
