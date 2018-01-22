package com.outsystems.plugins.loggerproxy;

import com.outsystems.plugins.oslogger.OSLogger;
import com.outsystems.plugins.oslogger.interfaces.Logger;

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
    private static final String ACTION_NATIVE_CRASH = "forceNativeCrash";

    private Logger logger = OSLogger.getInstance();

    @Override
    protected void pluginInitialize() { }

    @Override
    public boolean execute(String action, JSONArray args, final CallbackContext callbackContext) throws JSONException {
        if (ACTION_LOG_GENERAL.equals(action)) {
            String message = args.getString(0);
            String moduleName = args.getString(1);
            this.logger.logInfo(message, moduleName);

            return true;
        }
        else if (ACTION_LOG_TRACE.equals(action)) {
            String message = args.getString(0);
            String moduleName = args.getString(1);
            this.logger.logVerbose(message, moduleName);

            return true;
        }
        else if (ACTION_LOG_DEBUG.equals(action)) {
            String message = args.getString(0);
            String moduleName = args.getString(1);
            this.logger.logDebug(message, moduleName);

            return true;
        }
        else if (ACTION_LOG_WARNING.equals(action)) {
            String message = args.getString(0);
            String moduleName = args.getString(1);
            this.logger.logWarning(message, moduleName);
            
            return true;
        }
        else if (ACTION_LOG_ERROR.equals(action)) {
            String message = args.getString(0);
            String moduleName = args.getString(1);
            Exception e = new Exception(args.getString(2));
            this.logger.logError(message, moduleName, e);

            return true;
        }
        else if (ACTION_LOG_FATAL.equals(action)) {
            String message = args.getString(0);
            String moduleName = args.getString(1);
            Exception e = new Exception(args.getString(2));
            this.logger.logFatal(message, moduleName, e);

            return true;
        }
        else if(ACTION_NATIVE_CRASH.equals(action)){
            throw new RuntimeException("This is a crash");
        }    

        return false;
    }
}