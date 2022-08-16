import UIKit

internal class DropDownCell: UITableViewCell {
    private let itemLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        addSubview(itemLabel)
        itemLabel.translatesAutoresizingMaskIntoConstraints = false
        itemLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        itemLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func setupCell(title: String, textColor: UIColor? = nil,
                   backgroundColor: UIColor? = nil, font: UIFont? = nil) {
        itemLabel.text = title
        itemLabel.textColor = textColor
        itemLabel.font = font
        self.backgroundColor = backgroundColor ?? .lightGray
    }
}
