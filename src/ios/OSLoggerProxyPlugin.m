#import "OSLoggerProxyPlugin.h"
#import "OSLogger.h"

@interface OSLoggerProxyPlugin ()

@end
static OSDeviceInfo* deviceInfo;
@implementation OSLoggerProxyPlugin

#pragma mark - Life Cycle

-(void)pluginInitialize { }

# pragma mark - Interface

- (void)logMessageGeneral:(CDVInvokedUrlCommand *)command{
    if([[command arguments] count] < 2){
        return;
    }
    
    NSString *message = [[command arguments] objectAtIndex:0];
    NSString *moduleName = [[command arguments] objectAtIndex:1];
    
    [OSLogger logMessage:message withModule:moduleName withType:0];
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId: command.callbackId];
}

- (void)logMessageTrace:(CDVInvokedUrlCommand *)command{
    if([[command arguments] count] < 2){
        return;
    }
    
    NSString *message = [[command arguments] objectAtIndex:0];
    NSString *moduleName = [[command arguments] objectAtIndex:1];
    
    [OSLogger logMessage:message withModule:moduleName withType:1];
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId: command.callbackId];
}

- (void)logMessageDebug:(CDVInvokedUrlCommand *)command{
    if([[command arguments] count] < 2){
        return;
    }
    
    NSString *message = [[command arguments] objectAtIndex:0];
    NSString *moduleName = [[command arguments] objectAtIndex:1];
    
    [OSLogger logMessage:message withModule:moduleName withType:2];
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId: command.callbackId];
}

- (void)logMessageWarning:(CDVInvokedUrlCommand *)command{
    if([[command arguments] count] < 2){
        return;
    }
    
    NSString *message = [[command arguments] objectAtIndex:0];
    NSString *moduleName = [[command arguments] objectAtIndex:1];
    
    [OSLogger logMessage:message withModule:moduleName withType:3];
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId: command.callbackId];
}

- (void)logMessageError:(CDVInvokedUrlCommand *)command{
    if([[command arguments] count] < 3){
        return;
    }
    
    NSString *message = [[command arguments] objectAtIndex:0];
    NSString *moduleName = [[command arguments] objectAtIndex:1];
    NSException *stack = [[NSException alloc] initWithName:@"MyException" reason:[[command arguments] objectAtIndex:2] userInfo:nil];
    
    [OSLogger logMessage:message withModule:moduleName withStack:stack withType:4];
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId: command.callbackId];
}

- (void)logMessageFatal:(CDVInvokedUrlCommand *)command{
    if([[command arguments] count] < 3){
        return;
    }
    
    NSString *message = [[command arguments] objectAtIndex:0];
    NSString *moduleName = [[command arguments] objectAtIndex:1];
    NSException *stack = [[NSException alloc] initWithName:@"MyException" reason:[[command arguments] objectAtIndex:2] userInfo:nil];
    
    [OSLogger logMessage:message withModule:moduleName withStack:stack withType:5];
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId: command.callbackId];
}

@end

