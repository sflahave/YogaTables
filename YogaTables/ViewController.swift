//
//  ViewController.swift
//  YogaTables
//
//  Created by Shawn Flahave on 4/19/18.
//  Copyright © 2018 Shawn Flahave. All rights reserved.
//

import UIKit
import YogaKit
//import PinLayout
//import FlexLayout

class ViewController: UIViewController {

	var tableView: UITableView!

	public struct Constants {
		static let CustomCellId = "CustomCell"
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		tableView = UITableView(frame: .zero, style: .grouped)
		tableView.dataSource = self
		tableView.delegate = self
		tableView.rowHeight = UITableViewAutomaticDimension
		tableView.estimatedRowHeight = 44
		tableView.register(CustomCell.self, forCellReuseIdentifier: Constants.CustomCellId)

		view.addSubview(tableView)

		//		configureLayout()

		view.configureLayout { layout in
			layout.isEnabled = true
			layout.flexDirection = .column
			layout.width = YGValue(value: 100, unit: .percent)
			layout.height = YGValue(value: 100, unit: .percent)
		}

		tableView.configureLayout { layout in
			layout.isEnabled = true
			layout.height = YGValue(value: 100, unit: .percent)
			layout.width = YGValue(value: 100, unit: .percent)
			layout.flexGrow = 1
		}

		view.yoga.applyLayout(preservingOrigin: true)
	}

	public func configureLayout() {
		tableView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
			tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
			tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
			tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
		])
	}
}

extension ViewController: UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 3
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let row0Id = "ROW0"
		let row1Id = "ROW1"
		let row2Id = "ROW2"

		//		let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CustomCellId, for: indexPath) as! CustomCell

		switch indexPath.row {
		case 0:
			var cell = tableView.dequeueReusableCell(withIdentifier: row0Id) as? CustomCell
			if cell == nil {
				cell = CustomCell(reuseIdentifier: row0Id)
			}
			//			cell.label.text = "Name"
			//            cell.value.text = "Mr. Bungle"
//			cell!.labelText = "Name"
//			cell!.valueText = "The Count of Monte Cristo (French: Le Comte de Monte-Cristo) is an adventure novel by French author Alexandre Dumas (père) completed in 1844. It is one of the author's most popular works, along with The Three Musketeers. Like many of his novels, it is expanded from plot outlines suggested by his collaborating ghostwriter Auguste Maquet. The story takes place in France, Italy, and islands in the Mediterranean during the historical events of 1815–1839: the era of the Bourbon Restoration through the reign of Louis-Philippe of France."
			cell!.setText(labelText: "Name", valueText: "The Count of Monte Cristo (French: Le Comte de Monte-Cristo) is an adventure novel by French author Alexandre Dumas (père) completed in 1844. It is one of the author's most popular works, along with The Three Musketeers. Like many of his novels, it is expanded from plot outlines suggested by his collaborating ghostwriter Auguste Maquet. The story takes place in France, Italy, and islands in the Mediterranean during the historical events of 1815–1839: the era of the Bourbon Restoration through the reign of Louis-Philippe of France.")
			return cell!

		case 1:
			var cell = tableView.dequeueReusableCell(withIdentifier: row1Id) as? CustomCell
			if cell == nil {
				cell = CustomCell(reuseIdentifier: row1Id)
			}
			//			cell.label.text = "Song"
			//            cell.value.text = "Slowly Growing Deaf"
//			cell!.labelText = "Song"
//			cell!.valueText = "Slowly Growing Deaf"
			cell!.setText(labelText: "Song", valueText: "Slowly Growing Deaf")
			return cell!

		case 2:
			var cell = tableView.dequeueReusableCell(withIdentifier: row2Id) as? CustomCell
			if cell == nil {
				cell = CustomCell(reuseIdentifier: row2Id)
			}
//			cell!.labelText = "Name of the book"
//			cell!.valueText = "Nineteen Eighty-Four, often published as 1984, is a dystopian novel by English author George Orwell published in 1949. The novel is set in Airstrip One (formerly known as Great Britain), a province of the superstate Oceania in a world of perpetual war, omnipresent government surveillance and public manipulation, dictated by a political system euphemistically named English Socialism (or Ingsoc in the government's invented language, Newspeak) under the control of a privileged elite of the Inner Party, that persecutes individualism and independent thinking as thoughtcrime."
			cell!.setText(labelText: "Name of the book", valueText: "Nineteen Eighty-Four, often published as 1984, is a dystopian novel by English author George Orwell published in 1949. The novel is set in Airstrip One (formerly known as Great Britain), a province of the superstate Oceania in a world of perpetual war, omnipresent government surveillance and public manipulation, dictated by a political system euphemistically named English Socialism (or Ingsoc in the government's invented language, Newspeak) under the control of a privileged elite of the Inner Party, that persecutes individualism and independent thinking as thoughtcrime.")

			//			cell!.label.text = "Name of the book"
			//			cell!.value.text = "Nineteen Eighty-Four, often published as 1984, is a dystopian novel by English author George Orwell published in 1949. The novel is set in Airstrip One (formerly known as Great Britain), a province of the superstate Oceania in a world of perpetual war, omnipresent government surveillance and public manipulation, dictated by a political system euphemistically named English Socialism (or Ingsoc in the government's invented language, Newspeak) under the control of a privileged elite of the Inner Party, that persecutes individualism and independent thinking as thoughtcrime."
			return cell!

		default:
			return UITableViewCell()
		}
	}
}

extension ViewController: UITableViewDelegate {
	//	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
	//		return UITableViewAutomaticDimension
	//	}
	//
	//	func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
	//		return 80
	//	}
}
