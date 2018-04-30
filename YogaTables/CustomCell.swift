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
            label.yoga.markDirty()
        }
    }
    
    public var valueText: String? {
        didSet {
            value.text = valueText
			value.yoga.markDirty()
        }
    }
    
    convenience init(reuseIdentifier: String?) {
        self.init(style: .default, reuseIdentifier: reuseIdentifier)
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        label = UILabel()
        value = UILabel()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)

		self.backgroundColor = .white

        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setText(labelText: String, valueText: String?) {
        label.text = labelText
		label.sizeToFit()
		label.yoga.markDirty()

		value.text = valueText
		value.sizeToFit()
		value.yoga.markDirty()
	}

    private func setupSubviews() {
		label.font = UIFont.boldSystemFont(ofSize: 15)
		label.backgroundColor = .yellow
		label.numberOfLines = 1

		value.font = UIFont.systemFont(ofSize: 15)
		value.backgroundColor = UIColor.magenta
		value.numberOfLines = 0
		value.lineBreakMode = .byWordWrapping

		configureViewHierarchy()
		configureLayoutWithYoga()
//		configureLayoutWithAutolayout()
	}

	private func configureViewHierarchy() {
		contentView.addSubview(label)
		contentView.addSubview(value)
	}

	public func configureLayoutWithAutolayout() {
		label.translatesAutoresizingMaskIntoConstraints = false
		value.translatesAutoresizingMaskIntoConstraints = false

		label.sizeToFit()
		value.sizeToFit()

		label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
		value.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
		value.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)

		let layoutGuide = contentView.layoutMarginsGuide

		NSLayoutConstraint.activate([
			label.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: 8.0),
			label.centerYAnchor.constraint(equalTo: layoutGuide.centerYAnchor),

			value.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 8),
			value.centerYAnchor.constraint(equalTo: layoutGuide.centerYAnchor),
			value.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: -8),
			value.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: 8),
			value.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: -8)

		])
	}

	public func configureLayoutWithYoga() {
		label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
		value.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
		value.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)

		contentView.configureLayout { layout in
			layout.isEnabled = true
			layout.width = YGValue(value: 100, unit: .percent)
			layout.maxWidth = YGValue(value: 100, unit: .percent)
			layout.minHeight = 44
			layout.flexDirection = .row
			layout.justifyContent = .flexStart
			layout.padding = 8
		}

		label.configureLayout { layout in
			layout.isEnabled = true
			layout.alignSelf = .center
			layout.flexGrow = 1
		}

		value.configureLayout { layout in
			layout.isEnabled = true
			layout.flexGrow = 4
			layout.flexShrink = 1
			layout.marginLeft = 8
			layout.alignSelf = .center
		}
	}

	public override func layoutSubviews() {
		super.layoutSubviews()
		self.applyLayout()
		super.layoutSubviews()
	}

	public func applyLayout() {
		contentView.yoga.applyLayout(preservingOrigin: true, dimensionFlexibility: .flexibleHeigth)
	}

	public override func sizeThatFits(_ size: CGSize) -> CGSize {
		self.applyLayout()
		return contentView.sizeThatFits(size)
	}
}
