import MessageUI
import Preferences
import SecretShotPreferencesC

class RootListController: IOListController {
    
    override var specifiers: NSMutableArray? {
        get {
            if let specifiers = value(forKey: "_specifiers") as? NSMutableArray {
                return specifiers
            } else {
                let specifiers = loadSpecifiers(fromPlistName: "Root", target: self)
                setValue(specifiers, forKey: "_specifiers")
                return specifiers
            }
        }
        set {
            super.specifiers = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if FileManager.default.filesExist(atPaths: [prefsPath, "/Applications/Filza.app"]) {
            let plistButtonItem = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(self.viewPlist))
            navigationItem.rightBarButtonItem = plistButtonItem
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationController?.navigationBar.tintColor = .systemYellow
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIView.animate(withDuration: .infinity) {
            self.navigationController?.navigationController?.navigationBar.tintColor = nil
        }
    }
    
    @objc func viewPlist() {
        UIApplication.shared.open(URL(string: "filza://view\(prefsPath)")!, options: .init(), completionHandler: .none)
    }
    
    @objc func killSnapchat() {
        let task = NSTask()
        task.launchPath = "/usr/bin/killall"
        task.arguments = ["-9", "Snapchat"]
        task.launch()
        UINotificationFeedbackGenerator().notificationOccurred(.success)
    }
    
    @objc func openDiscord() {
        UIApplication.shared.open(URL(string: "https://discord.gg/pbNmgKf453")!, options: .init(), completionHandler: .none)
    }
    
    @objc func openGithub() {
        UIApplication.shared.open(URL(string: "https://github.com/EamonTracey/SecretShot")!, options: .init(), completionHandler: .none)
    }
    
}

private extension FileManager {
    func filesExist(atPaths paths: [String]) -> Bool {
        for path in paths {
            if !FileManager.default.fileExists(atPath: path) {
                return false
            }
        }
        return true
    }
}
