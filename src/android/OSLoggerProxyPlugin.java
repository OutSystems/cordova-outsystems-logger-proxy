package com.outsystems.plugins.loggerproxy;

import com.outsystems.plugins.oslogger.enums.OSLogType;
import com.outsystems.plugins.oslogger.OSLogger;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;

import org.json.JSONArray;
import org.json.JSONException;

public class OSLoggerProxyPlugin extends CordovaPlugin {

    private static final String ACTION_LOG_GENERAL = "logMessageGeneral";
    private static final String ACTION_LOG_TRACE = "logMessageTrace";
    private static final String ACTION_LOG_DEBUG = "logMessageDebug";
    private static final String ACTION_LOG_WARNING = "logMessageWarning";
    private static final String ACTION_LOG_ERROR = "logMessageError";
    private static final String ACTION_LOG_FATAL = "logMessageFatal";

    @Override
    protected void pluginInitialize() { }

    @Override
    public boolean execute(String action, JSONArray args, final CallbackContext callbackContext) throws JSONException {
        if (ACTION_LOG_GENERAL.equals(action)) {
            String message = args.getString(0);
            String moduleName = args.getString(1);

            OSLogType logType = OSLogType.values()[0];

            OSLogger.logMessage(message, moduleName, logType);
            callbackContext.success();

            return true;
        }
        else if (ACTION_LOG_TRACE.equals(action)) {
            String message = args.getString(0);
            String moduleName = args.getString(1);

            OSLogType logType = OSLogType.values()[1];

            OSLogger.logMessage(message, moduleName, logType);
            callbackContext.success();
            
            return true;
        }
        else if (ACTION_LOG_DEBUG.equals(action)) {
            String message = args.getString(0);
            String moduleName = args.getString(1);

            OSLogType logType = OSLogType.values()[2];

            OSLogger.logMessage(message, moduleName, logType);
            callbackContext.success();
            
            return true;
        }
        else if (ACTION_LOG_WARNING.equals(action)) {
            String message = args.getString(0);
            String moduleName = args.getString(1);

            OSLogType logType = OSLogType.values()[3];

            OSLogger.logMessage(message, moduleName, logType);
            callbackContext.success();
            
            return true;
        }
        else if (ACTION_LOG_ERROR.equals(action)) {
            String message = args.getString(0);
            String moduleName = args.getString(1);
            Exception stack = new Exception(args.getString(2));

            OSLogType logType = OSLogType.values()[4];

            OSLogger.logMessage(message, moduleName, stack, logType);
            callbackContext.success();
            
            return true;
        }
        else if (ACTION_LOG_FATAL.equals(action)) {
            String message = args.getString(0);
            String moduleName = args.getString(1);
            Exception stack = new Exception(args.getString(2));

            OSLogType logType = OSLogType.values()[5];

            OSLogger.logMessage(message, moduleName, stack, logType);
            callbackContext.success();
            
            return true;
        }

        return false;
    }
}