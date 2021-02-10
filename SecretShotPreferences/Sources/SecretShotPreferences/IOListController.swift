import Preferences

class IOListController: PSListController {
    
    let prefsPath = "/User/Library/Preferences/com.eamontracey.secretshotpreferences.plist"
    
    override func readPreferenceValue(_ specifier: PSSpecifier!) -> Any! {
        let prefs = NSDictionary(contentsOfFile: prefsPath)
        return prefs?[specifier.property(forKey: "key") as Any] ?? specifier.property(forKey: "default")
    }
    
    override func setPreferenceValue(_ value: Any!, specifier: PSSpecifier!) {
        let prefs = NSMutableDictionary(contentsOfFile: prefsPath) ?? NSMutableDictionary()
        prefs.setValue(value, forKey: specifier.property(forKey: "key") as! String)
        prefs.write(toFile: prefsPath, atomically: true)
        CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), CFNotificationName("com.eamontracey.secretshotpreferences/update" as CFString), nil, nil, true)
    }

}
