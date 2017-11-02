//
//  FirstViewController.m
//  WyhSDK
//
//  Created by 王乙涵 on 2017/10/9.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import "FirstViewController.h"

#import "WyhAccelerateViewController.h"
#import "WyhAccountsViewController.h"
#import "WyhAddressBookViewController.h"
#import "WyhAddressBookUIViewController.h"
#import "WyhContactsUIViewController.h"
#import "WyhAdSupportViewController.h"
#import "WyhARKitViewController.h"
#import "WyhAssetsLibraryViewController.h"
#import "WyhAudioToolboxViewController.h"
#import "WyhAudioUnitViewController.h"
static NSString *cellId = @"cellId";
@interface FirstViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation FirstViewController
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
        [_dataArray addObjectsFromArray:@[@"Accelerate 包含加速数学和DSP函数。"
                                          ,@"Accounts 帮助用户访问和管理他们的外部帐户，而不需要他们进入账户的登录认证。"
                                          ,@"AddressBook 包含直接访问用户联系人数据库的函数。"
                                          ,@"AddressBookUI 包含显示系统定义的联系人挑选界面和编辑界面的类。"
                                          ,@"AdSupport 广告支持框架，提供访问用户的广告标示符号，以及判断用户是否限制了广告跟踪。"
                                          ,@"ARKit 增强现实技术."
                                          ,@"AssetsLibrary 包含显示用户照片和视频的类."
                                          ,@"AudioToolbox 包含处理音频流数据以及播放或录制音频的接口。"
                                          ,@"AudioUnit 包含加载并使用音频单元的接口。"
                                          ,@"AVFoundation 包含播放或录制音频的Objective-C接口。"
                                          ,@"AVKit 视频播放API"
                                          ,@"CallKit 让语音或视讯电话的开发者将 UI 界面整合在 iPhone 原生的电话 App 中"
                                          ,@"CFNetwork 包含通过WiFi或者蜂窝无线访问网络的接口。"
                                          ,@"CloundKit 云端数据库,存储数据,提供简单的增删改查功能"
                                          ,@"Contacts 联系人框架，简单易用，使用它可以很容易地查找、创建和更新联系人信息"
                                          ,@"ContactsUI 有图形界面的联系人获取方法"
                                          ,@"CoreAudio 包含Core Audio框架使用的各种数据类型。"
                                          ,@"CoreAudioKit 包含Core Audio框架使用的各种数据类型。"
                                          ,@"CoreBluetooth 蓝牙开发"
                                          ,@"CoreData 数据库"
                                          ,@"CoreFoundation C语言提供基本数据管理和服务功能"
                                          ,@"CoreGraphics 绘图操作"
                                          ,@"CoreImage 图像处理"
                                          ,@"CoreLocation 定位"
                                          ,@"CoreMedia 底层媒体类型"
                                          ,@"CoreMIDI 提供与MIDI设备通讯的标准方式,包括硬件键盘和合成器。"
                                          ,@"CoreML 机器学习框架"
                                          ,@"CoreMotion 传感器"
                                          ,@"CoreNFC 处理NFC阅读Tag"
                                          ,@"CoreSpotlight 搜索"
                                          ,@"CoreTelephony 电话，网络"
                                          ,@"CoreText 文本引擎"
                                          ,@"CoreVideo 视频/音频底层"
                                          ,@"DeviceCheck 设备检查"
                                          ,@"EventKit 事件提醒开发包"
                                          ,@"EventKitUI 提供了一些视图控制器用于显示和编辑日历事件"
                                          ,@"ExternalAccessory 提供一个管道,让外围设备可以和基于iOS系统的设备进行通讯"
                                          ,@"FileProvider 用于添加第三方存储服务"
                                          ,@"FileProviderUI 用于添加第三方存储服务"
                                          ,@"Foundation 提供基本数据管理和服务功能"
                                          ,@"GameController 游戏手柄"
                                          ,@"GameKit 交互游戏平台Game Center，P2P设备通讯功能 ，In-Game Voice"
                                          ,@"GameplayKit 手游开发工具"
                                          ,@"GLKit 提供的基于OpenGL ES的iOS框架"
                                          ,@"GSS 给ios应用提供一组标准安全相关的服务"
                                          ,@"HealthKit 直接与健康和健身设备一起工作"
                                          ,@"HealthKitUI 直接与健康和健身设备一起工作"
                                          ,@"HomeKit 允许用户创建一个或者多个Home布局。每个Home(HMHome)代表一个有网络设备的住所。"
                                          ,@"iAd 广告"
                                          ,@"IdentityLookup 拦截，过滤"
                                          ,@"ImageIO 读取图像数据，写图像数据"
                                          ,@"Intents 处理来自Siri或映射的用户请求"
                                          ,@"IntentsUI 处理来自Siri或映射的用户请求"
                                          ,@"IOSurface 截屏"
                                          ,@"JavaScriptCore OC JS交互"
                                          ,@"LocalAuthentication 指纹识别的"
                                          ,@"MapKit 地图"
                                          ,@"MediaAccessibility 管理媒体文件中closed-caption内容的呈现。"
                                          ,@"MediaPlayer 视频播放"
                                          ,@"MediaToolbox 解码编码"
                                          ,@"Messages Messages应用"
                                          ,@"MessagesUI Messages应用"
                                          ,@"Metal 图形处理"
                                          ,@"MetalKit 图形处理"
                                          ,@"MetalPerformanceShaders 图形处理"
                                          ,@"MoblieCoreServices 此框架定义统一类型标识符 (UTIs)使用的底层类型"
                                          ,@"ModelIO 提供了3D模型资产和相关资源的一个系统级理解"
                                          ,@"MultipeerConnectivity 使附近设备通过Wi-Fi网络、P2P Wi-Fi以及蓝牙个人局域网进行通信的框架"
                                          ,@"NetworkExtension 提供了配置和控制VPN支持的接口,和wifi热点相关的接口"
                                          ,@"NewsstandKit 主要都是报刊杂志，在系统自带的Newsstand应用中，Newsstand应用都是一些轻的展示类杂志应用。"
                                          ,@"NotificationCenter 通知，推送"
                                          ,@"OpenAL 播放音频流"
                                          ,@"OpenGLES 图形处理"
                                          ,@"PassKit Apple Pay"
                                          ,@"PDFKit PDF文档开发"
                                          ,@"Photos 相册，视频，图片"
                                          ,@"PhotosUI 相册，视频，图片"
                                          ,@"PushKit 远程推送"
                                          ,@"QuartzCore 核心动画框架"
                                          ,@"QuickLook 查看文件"
                                          ,@"ReplayKit 录屏"
                                          ,@"SafariServices Safari浏览器开发"
                                          ,@"SceneKit 类似于Unity是一个制作3D物件的框架"
                                          ,@"Security 用于保证应用程序所管理之数据的安全"
                                          ,@"Social 社会化分享框架"
                                          ,@"Speech 语音识别TTS"
                                          ,@"SpriteKit 游戏精灵"
                                          ,@"StoreKit 内购"
                                          ,@"SystemConfiguration 包含用于处理设备网络配置的接口"
                                          ,@"Twitter 推特"
                                          ,@"UIKit 开发iOS应用UI界面的类"
                                          ,@"UserNotifications 消息推送"
                                          ,@"UserNotificationsUI 消息推送"
                                          ,@"VideoSubscriberAccount 来帮助应用支持流媒体认证或认证视频点播"
                                          ,@"VideoToolbox 硬编码与硬解码的API,一组用C语言写的函数。"
                                          ,@"Vision 一个高性能的图片分析库,他能识别在图片和视频中的人脸、特征、场景分类"
                                          ,@"WatchConnectivity Apple Watch与iPhone数据通信"
                                          ,@"WatchKit 构建Watch应用"
                                          ,@"WebKit 专门负责处理网页视图的框架"
                                          ]];
    }
    return _dataArray;
}
-(UITableView *)table{
    if (!_table) {
        _table = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _table.delegate = self;
        _table.dataSource = self;
        _table.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_table registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
    }
    return _table;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.wyhTitle.wyhtext(@"WyhSDK");
    
    [self.view wyh_addSubView:@[self.table]];
    
    self.table
    .wyhTop(self.wyhNavi, 1)
    .wyhLeft(self.view, 0)
    .wyhRight(self.view, 0)
    .wyhBottom(self.view, 0);
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 48;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *vc = nil;
    if (indexPath.row==0) {
         vc = WyhAccelerateViewController.new;
    }else if (indexPath.row==1){
        vc = WyhAccountsViewController.new;
    }else if (indexPath.row==2){
        vc = WyhAddressBookViewController.new;
    }else if (indexPath.row==3){
        vc = WyhAddressBookUIViewController.new;
    }else if (indexPath.row==4){
        vc = WyhAdSupportViewController.new;
    }else if (indexPath.row==5){
        vc = WyhARKitViewController.new;
    }else if (indexPath.row==6){
        vc = WyhAssetsLibraryViewController.new;
    }else if (indexPath.row==7){
        vc = WyhAudioToolboxViewController.new;
    }else if (indexPath.row==8){
        vc = WyhAudioUnitViewController.new;
    }else if (indexPath.row==15){
        vc = WyhContactsUIViewController.new;
    }
    if (vc) {
        [self wyhPush:vc];
    }else{
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
