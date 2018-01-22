#import <Cordova/CDVPlugin.h>

@interface OSLoggerProxyPlugin : CDVPlugin

- (void)logMessageGeneral:(CDVInvokedUrlCommand *)command;

- (void)logMessageTrace:(CDVInvokedUrlCommand *)command;

- (void)logMessageDebug:(CDVInvokedUrlCommand *)command;

- (void)logMessageWarning:(CDVInvokedUrlCommand *)command;

- (void)logMessageError:(CDVInvokedUrlCommand *)command;

- (void)logMessageFatal:(CDVInvokedUrlCommand *)command;

- (void)forceNativeCrash:(CDVInvokedUrlCommand *)command;

@end

