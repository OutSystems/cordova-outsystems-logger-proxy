#import "OSLoggerProxyPlugin.h"
#import "OSLogger.h"

@interface OSLoggerProxyPlugin ()

@property (nonatomic, readonly, strong) id <OSLoggerProtocol> logger;

@end

static OSDeviceInfo* deviceInfo;
@implementation OSLoggerProxyPlugin

#pragma mark - Life Cycle

-(void)pluginInitialize { 
    _logger = [OSLogger sharedInstance];
}

# pragma mark - Interface

+ (id)sharedInstance {
    static OSLoggerProxyPlugin *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)logMessageGeneral:(CDVInvokedUrlCommand *)command{
    if([[command arguments] count] < 2){
        return;
    }
    
    NSString *message = [[command arguments] objectAtIndex:0];
    NSString *moduleName = [[command arguments] objectAtIndex:1];
    
    [_logger logInfo:message withModule:moduleName];

    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId: command.callbackId];
}

- (void)logMessageTrace:(CDVInvokedUrlCommand *)command{
    if([[command arguments] count] < 2){
        return;
    }
    
    NSString *message = [[command arguments] objectAtIndex:0];
    NSString *moduleName = [[command arguments] objectAtIndex:1];
    
    [_logger logVerbose:message withModule:moduleName];
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId: command.callbackId];
}

- (void)logMessageDebug:(CDVInvokedUrlCommand *)command{
    if([[command arguments] count] < 2){
        return;
    }
    
    NSString *message = [[command arguments] objectAtIndex:0];
    NSString *moduleName = [[command arguments] objectAtIndex:1];
    
    [_logger logDebug:message withModule:moduleName];
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId: command.callbackId];
}

- (void)logMessageWarning:(CDVInvokedUrlCommand *)command{
    if([[command arguments] count] < 2){
        return;
    }
    
    NSString *message = [[command arguments] objectAtIndex:0];
    NSString *moduleName = [[command arguments] objectAtIndex:1];
    
    [_logger logWarning:message withModule:moduleName];
    
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
    
    [_logger logError:message withModule:moduleName withStack:stack];
    
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
    
    [_logger logFatal:message withModule:moduleName withStack:stack];
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId: command.callbackId];
}

@end

