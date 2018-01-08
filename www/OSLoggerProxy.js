var exec = require('cordova/exec');
    
exports.logMessageGeneral = function (message, moduleName, success, fail) {
    if(!message || message.length == 0) {
        throw new Error('Invalid message!');
    }
    
    if(!moduleName || moduleName.length == 0) {
        throw new Error('Invalid module name!');
    }
    
    exec(success, fail, "OSLoggerProxy", "logMessageGeneral", [message, moduleName]);
}

exports.logMessageTrace = function (message, moduleName, success, fail) {
    if(!message || message.length == 0) {
        throw new Error('Invalid message!');
    }
    
    if(!moduleName || moduleName.length == 0) {
        throw new Error('Invalid module name!');
    }
    
    exec(success, fail, "OSLoggerProxy", "logMessageTrace", [message, moduleName]);
}

exports.logMessageDebug = function (message, moduleName, success, fail) {
    if(!message || message.length == 0) {
        throw new Error('Invalid message!');
    }
    
    if(!moduleName || moduleName.length == 0) {
        throw new Error('Invalid module name!');
    }
    
    exec(success, fail, "OSLoggerProxy", "logMessageDebug", [message, moduleName]);
}

exports.logMessageWarning = function (message, moduleName, success, fail) {
    if(!message || message.length == 0) {
        throw new Error('Invalid message!');
    }
    
    if(!moduleName || moduleName.length == 0) {
        throw new Error('Invalid module name!');
    }
    
    exec(success, fail, "OSLoggerProxy", "logMessageWarning", [message, moduleName]);
}

exports.logMessageError = function (message, moduleName, stack, success, fail) {
    if(!message || message.length == 0) {
        throw new Error('Invalid message!');
    }
    
    if(!moduleName || moduleName.length == 0) {
        throw new Error('Invalid module name!');
    }
    
    exec(success, fail, "OSLoggerProxy", "logMessageError", [message, moduleName, stack]);
}

exports.logMessageFatal = function (message, moduleName, stack, success, fail) {
    if(!message || message.length == 0) {
        throw new Error('Invalid message!');
    }
    
    if(!moduleName || moduleName.length == 0) {
        throw new Error('Invalid module name!');
    }
    
    exec(success, fail, "OSLoggerProxy", "logMessageFatal", [message, moduleName, stack]);
}