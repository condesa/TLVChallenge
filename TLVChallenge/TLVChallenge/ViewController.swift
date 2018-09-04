//
//  ViewController.swift
//  TLVChallenge
//
//  Created by Aurora Rodríguez on 9/3/18.
//  Copyright © 2018 Aurora Rodríguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var inputTextView: UITextView!
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var clearButton: UIButton!

  var items: [TLVModel]?
  let cellIdentifier = "TLVDetailCell"

  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
  }

  fileprivate func setupTableView(){
    tableView.delegate = self
    tableView.dataSource = self
    tableView.estimatedRowHeight = 44
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.backgroundColor = .clear
    tableView.register(UINib(nibName: cellIdentifier, bundle: nil),
                       forCellReuseIdentifier: cellIdentifier)
    tableView.reloadData()
  }

  @IBAction func handleDecode(_ sender: Any) {
    guard let hexString = cleanHexadecimalString(inputTextView.text) else { return }
    guard let data = Data(hexString: hexString) else { return }
    
    items = TLVModel.create(from: data)
    tableView.reloadData()
  }
  
  @IBAction func handleClear(_ sender: Any) {
    inputTextView.text = ""
    items = nil
    tableView.reloadData()
  }
}
extension ViewController: UITableViewDataSource, UITableViewDelegate {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let count = items?.count else { return 0 }
    return count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                   for: indexPath) as? TLVDetailCell else {
                                                    return UITableViewCell()
    }
    
    if let item = items?[indexPath.item] {
      cell.model = item
    }
    return cell
  }

  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    return UIView()
  }
}
