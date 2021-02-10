import Preferences

class YellowInfoSwitchTableCell: PSSwitchTableCell {
    
    var infoButton: UIButton! = nil
    
    override var control: UIControl! {
        get {
            if let control = super.control as? UISwitch {
                control.onTintColor = .systemYellow
            }
            return super.control
        }
        set {
            super.control = newValue
        }
    }
    
    override func refreshCellContents(with specifier: PSSpecifier!) {
        super.refreshCellContents(with: specifier)
        
        infoButton = UIButton(type: UIButton.ButtonType.infoDark)
        infoButton.tintColor = .systemGray
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        infoButton.addTarget(self, action: #selector(self.infoButtonTapped), for: .touchUpInside)
        contentView.addSubview(infoButton)
        NSLayoutConstraint.activate([
            infoButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            infoButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4)
        ])
    }
    
    @objc func infoButtonTapped() {
        let message = "Thank you for downloading SecretShot! When enabled, SecretShot will block Snapchat from knowing when you take screenshots and screen recordings. SecretShot does not hook Snapchat classes. This means Snapchat will not detect any tweak injection (thus, you will not be banned). Enjoy!"
        let alert = UIAlertController(title: "Tweak Info", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Okay!", style: .default, handler: .none)
        alert.addAction(okAction)
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: .none)
    }
    
}
