import UIKit

open class DropDownSw: UIView {
    private var itemColor: UIColor?
    private var itemTextColor: UIColor?
    private var itemFont: UIFont?
    private let arrowDownImage = UIImage(named: "arrow.triangle.down", in: Bundle(for: DropDownSw.self), compatibleWith: nil)?
                                    .withRenderingMode(.alwaysTemplate)
    private let arrowUpImage = UIImage(named: "arrow.triangle.up", in: Bundle(for: DropDownSw.self), compatibleWith: nil)?
                                    .withRenderingMode(.alwaysTemplate)
    
    private let mainView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "dropDown"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    private let arrowImageView = UIImageView(image: UIImage(named: "arrow.triangle.down", in: Bundle(for: DropDownSw.self),
                                                            compatibleWith: nil)?.withRenderingMode(.alwaysTemplate))
    private let dropDownTableView = UITableView()
    private var isCollapsed: Bool = true
    private var items: [String] = []
    private var dropDownHeight: NSLayoutConstraint?
    public var delegate: DropDownSwDelegate?
    
    public init(mainColor: UIColor? = nil, itemColor: UIColor? = nil, titleColor: UIColor? = nil,
                itemTextColor: UIColor? = nil, title: String? = nil, mainFont: UIFont? = nil,
                itemFont: UIFont? = nil, arrowColor: UIColor? = nil) {
        super.init(frame: .zero)
        mainView.backgroundColor = mainColor ?? .gray
        titleLabel.textColor = titleColor ?? .white
        titleLabel.text = title ?? "dropDown"
        titleLabel.font = mainFont ?? .boldSystemFont(ofSize: 16)
        arrowImageView.tintColor = arrowColor ?? .black
        self.itemColor = itemColor ?? .lightGray
        self.itemTextColor = itemTextColor ?? .black
        self.itemFont = itemFont ?? .systemFont(ofSize: 16)
        setupView(title: title ?? "dropDown", font: mainFont ?? .boldSystemFont(ofSize: 16))
        setupTableView()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(title: String, font: UIFont) {
        addSubview(mainView)
        mainView.addSubview(titleLabel)
        mainView.addSubview(arrowImageView)
        addSubview(dropDownTableView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        mainView.translatesAutoresizingMaskIntoConstraints = false
        dropDownTableView.translatesAutoresizingMaskIntoConstraints = false
        mainView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        mainView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: arrowImageView.leadingAnchor, constant: -5).isActive = true
        arrowImageView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
        arrowImageView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10).isActive = true
        arrowImageView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        arrowImageView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        dropDownTableView.topAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
        dropDownTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        dropDownTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        dropDownTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dropDownHeight = dropDownTableView.heightAnchor.constraint(equalToConstant: 60)
        dropDownHeight?.isActive = true
        
        let boundingRect = NSString(string: title)
            .boundingRect(with: .init(width: .greatestFiniteMagnitude, height: Double(30)),
                          options: .usesLineFragmentOrigin,
                          attributes: [.font: font],
                          context: nil)
        let width = 10 + boundingRect.width + 6 + 10 + 10
        let maxScreenWidth = UIScreen.main.bounds.width
        mainView.widthAnchor.constraint(equalToConstant: min(width, maxScreenWidth)).isActive = true
        mainView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapDropDown))
        mainView.addGestureRecognizer(tapGesture)
    }
    
    func setupTableView() {
        dropDownTableView.delegate = self
        dropDownTableView.dataSource = self
        dropDownTableView.register(DropDownCell.self, forCellReuseIdentifier: String(describing: DropDownCell.self))
        dropDownTableView.separatorStyle = .none
        dropDownTableView.isHidden = true
        dropDownTableView.layer.cornerRadius = 10
        dropDownTableView.clipsToBounds = true
        dropDownTableView.isScrollEnabled = false
    }
    
    @objc private func tapDropDown() {
        isCollapsed.toggle()
        arrowImageView.image = isCollapsed ? arrowDownImage : arrowUpImage
        dropDownTableView.isHidden = isCollapsed
        
        if !isCollapsed {
            dropDownHeight?.isActive = false
            let maxHeight = UIScreen.main.bounds.height - (frame.minY + 30)
            let tableViewHeight = CGFloat(items.count * 50)
            dropDownTableView.isScrollEnabled = tableViewHeight > maxHeight
            dropDownHeight = dropDownTableView.heightAnchor.constraint(equalToConstant: min(tableViewHeight, maxHeight))
            dropDownHeight?.isActive = true
        }
    }
    
    public func addItem(_ item: String) {
        items.append(item)
    }
    
    public func deleteItem(_ item: String) {
        guard let index = items.firstIndex(of: item) else { return }
        items.remove(at: index)
    }
}

extension DropDownSw: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DropDownCell.self), for: indexPath)
        
        if let cell = cell as? DropDownCell {
            cell.setupCell(title: items[indexPath.row], textColor: itemTextColor, backgroundColor: itemColor, font: itemFont)
        }
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.tapItem(index: indexPath.row)
    }
}

public protocol DropDownSwDelegate {
    func tapItem(index: Int)
}
