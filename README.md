# cordova-outsystems-logger-proxy

## Usage

```javascript

function success(){
    console.log("Log with success");
}

function error(errorMsg){
    console.log("Error logging message", errorMsg);
}

//Log Message
OSLogger.logMessageGeneral("Sample Error log", "Login", success, fail);

OSLogger.logMessageTrace("Sample Error log", "Login", success, fail);

OSLogger.logMessageDebug("Sample Error log", "Login", success, fail);

OSLogger.logMessageWarning("Sample Error log", "Login", success, fail);

OSLogger.logMessageError("Sample Error log", "Login", "Stack", success, fail);

OSLogger.logMessageFatal("Sample Error log", "Login", "Stack", success, fail);

```
