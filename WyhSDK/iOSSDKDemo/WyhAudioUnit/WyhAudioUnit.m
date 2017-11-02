//
//  WyhAudioUnit.m
//  WyhSDK
//
//  Created by 王乙涵 on 2017/11/1.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import "WyhAudioUnit.h"
#import <AudioUnit/AudioUnit.h>
@implementation WyhAudioUnit
//回调方法

static OSStatus recordingCallBack(void *inRefCon,
                                  AudioUnitRenderActionFlags *ioActionFlads,
                                  const AudioTimeStamp *inTimeStamp,
                                  UInt32 inBUsNumber,
                                  UInt32 inNumberFrames,
                                  AudioBufferList *ioData){
    AudioBufferList *bufferList = NULL;
    AudioUnit audioUnit = NULL ;
    OSStatus status = AudioUnitRender(audioUnit, ioActionFlads, inTimeStamp, inBUsNumber, inNumberFrames, bufferList);
    
    return noErr;
}

static OSStatus playbackCallback(void *inRefCon,
                                 AudioUnitRenderActionFlags *ioActionFlags,
                                 const AudioTimeStamp *inTimeStamp,
                                 UInt32 inBusNumber,
                                 UInt32 inNumberFrames,
                                 AudioBufferList *ioData){
    
    return noErr;
}
+(void)desc{
    //描述音频单元
    AudioComponentDescription desc;
    desc.componentType = kAudioUnitType_Output;
    desc.componentSubType = kAudioUnitSubType_RemoteIO;
    desc.componentFlags = 0;
    desc.componentFlagsMask = 0;
    desc.componentManufacturer = kAudioUnitManufacturer_Apple;
    
    
    //查找音频单元
    AudioComponent inputComponent = AudioComponentFindNext(NULL, &desc);
    
    //获取音频单元实例
    AudioComponentInstance audioUnit ;
    OSStatus  status = AudioComponentInstanceNew(inputComponent, &audioUnit);
    
    //启用录制功能、启用播放功能
    AudioUnitElement kInputBus = 0;
    UInt32 flag = 1;
    status = AudioUnitSetProperty(audioUnit, kAudioOutputUnitProperty_EnableIO, kAudioUnitScope_Input, kInputBus, &flag, sizeof(flag));
    
    AudioUnitElement kOutputBus = 0;
    status = AudioUnitSetProperty(audioUnit, kAudioOutputUnitProperty_EnableIO, kAudioUnitScope_Output, kOutputBus, &flag, sizeof(flag));
    
    //音频流描述
    AudioStreamBasicDescription audioFormat;
    audioFormat.mSampleRate = 44100.00;
    audioFormat.mFormatID = kAudioFormatLinearPCM;
    audioFormat.mFormatFlags = kAudioFormatFlagIsSignedInteger | kAudioFormatFlagIsPacked;
    audioFormat.mFramesPerPacket =1;
    audioFormat.mChannelsPerFrame = 1;
    audioFormat.mBitsPerChannel = 16;
    audioFormat.mBytesPerPacket = 2;
    audioFormat.mBytesPerFrame = 2;
    
    //应用录制和播放的音频流描述
    status  = AudioUnitSetProperty(audioUnit, kAudioUnitProperty_StreamFormat, kAudioUnitScope_Output, kInputBus, &audioFormat, sizeof(audioFormat));
    
    status = AudioUnitSetProperty(audioUnit, kAudioUnitProperty_StreamFormat, kAudioUnitScope_Input, kOutputBus, &audioFormat, sizeof(audioFormat));
    
    //设置回调
    AURenderCallback recordingCallback = NULL;
    
    AURenderCallbackStruct callbackStruct;
    callbackStruct.inputProc =  recordingCallback;
    callbackStruct.inputProcRefCon = (__bridge void * _Nullable)(self);
    status = AudioUnitSetProperty(audioUnit, kAudioOutputUnitProperty_SetInputCallback, kAudioUnitScope_Global, kInputBus, &callbackStruct, sizeof(callbackStruct));
    
    AURenderCallback playbackCallback = NULL;
    callbackStruct.inputProc = playbackCallback;
    callbackStruct.inputProcRefCon = (__bridge void * _Nullable)(self);
    status = AudioUnitSetProperty(audioUnit, kAudioUnitProperty_SetRenderCallback, kAudioUnitScope_Global, kOutputBus, &callbackStruct, sizeof(callbackStruct));
    
    
}

@end
