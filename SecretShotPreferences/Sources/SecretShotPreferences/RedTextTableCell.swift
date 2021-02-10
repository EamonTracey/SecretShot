import Preferences

class RedTextTableCell: PSTableCell {
    
    override var textLabel: UILabel? {
        super.textLabel?.textColor = .systemRed
        super.textLabel?.highlightedTextColor = .systemRed
        return super.textLabel
    }
    
}
