//
//  CustomCell.swift
//  YogaTables
//
//  Created by Shawn Flahave on 4/19/18.
//  Copyright © 2018 Shawn Flahave. All rights reserved.
//

import UIKit
import YogaKit

class CustomCell: UITableViewCell {
    
    var label: UILabel!
    var value: UILabel!
    
    public var labelText: String? {
        didSet {
            label.text = labelText
            label.sizeToFit()
        }
    }
    
    public var valueText: String? {
        didSet {
            value.text = valueText
        }
    }
    
    convenience init(reuseIdentifier: String?) {
        self.init(style: .default, reuseIdentifier: reuseIdentifier)
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        label = UILabel()
        value = UILabel()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setText(labelText: String, valueText: String?) {
        label.text = labelText
        value.text = valueText
        applyLayout()
    }
    
    private func setupSubviews() {
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.backgroundColor = .yellow
        contentView.addSubview(label)
        
        value.font = UIFont.systemFont(ofSize: 15)
        value.backgroundColor = UIColor.magenta
        contentView.addSubview(value)

		configureLayout()
    }

	public func configureLayout() {
		contentView.configureLayout { layout in
			layout.isEnabled = true
			layout.width = YGValue(value: 100, unit: .percent)
			layout.maxWidth = YGValue(value: 100, unit: .percent)
			layout.height = YGValue(value: 100, unit: .percent)
			layout.minHeight = 44
			layout.flexDirection = .row
			layout.justifyContent = .flexStart
			layout.alignItems = .center
			layout.marginLeft = 16
			layout.marginRight = 16
		}

		label.configureLayout { layout in
			layout.isEnabled = true
			layout.alignSelf = .center
			layout.minHeight = 21
			layout.minWidth = 30
		}

		value.configureLayout { layout in
			layout.isEnabled = true
			layout.minHeight = 44
			layout.flexGrow = 2
			layout.flexShrink = 1
			layout.marginLeft = 8
			layout.alignSelf = .center
		}

		applyLayout()
	}

    public override func layoutSubviews() {
        super.layoutSubviews()
        configureLayout()
    }
    
    public func applyLayout() {
        contentView.yoga.applyLayout(preservingOrigin: false)
    }

//    public override func sizeThatFits(_ size: CGSize) -> CGSize {
//        applyLayout()
//        return contentView.sizeThatFits(size)
//    }
}
