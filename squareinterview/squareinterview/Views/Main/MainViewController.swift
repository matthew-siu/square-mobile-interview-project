//
//  MainViewController.swift
//  squareinterview
//
//  Created by Matthew Siu on 6/9/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

// MARK: - Display logic, receive view model from presenter and present
protocol MainDisplayLogic: AnyObject
{
    func displayInitialState(vm: Main.ViewModel)
}

// MARK: - View Controller body
class MainViewController: BaseViewController, MainDisplayLogic
{
    // VIP
    var interactor: MainBusinessLogic?
    var router: (NSObjectProtocol & MainRoutingLogic & MainDataPassing)?
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.refreshUI), for: UIControl.Event.valueChanged)
        return refreshControl
    }()
    
    enum TableCell: String {
        case cell = "EmployerTableViewCell"
    }
    
    var vm: Main.ViewModel = .init(cells: [])
}

// MARK: - View Lifecycle
extension MainViewController {
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.addSubview(self.refreshControl)
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.register(UINib(nibName: TableCell.cell.rawValue, bundle: nil), forCellReuseIdentifier: TableCell.cell.rawValue)
        
//        URLCache.shared.removeAllCachedResponses()
        
        self.initUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    func initUI(){
        self.title = "Employee List"
        
        self.showProgressBar()
        self.interactor?.loadInitialState()
    }
    
    @objc
    func refreshUI(){
        self.interactor?.loadInitialState()
    }
    
    func displayInitialState(vm: Main.ViewModel){
        self.showProgressBar(false)
        self.refreshControl.endRefreshing()
        self.vm = vm
        self.tableView.reloadData()
        if let error = vm.errMsg{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.showAlert("Reminder", error, completion: nil)
            }
            
        }
    }
    
    
}

// MARK:- View Display logic entry point
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.vm.cells.count == 0) ? 1 : self.vm.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.vm.cells.count == 0{
            let cell = UITableViewCell()
            cell.textLabel?.text = "No employee."
            cell.textLabel?.textAlignment = .center
            cell.selectionStyle = .none
            return cell
        }else{
            let item = self.vm.cells[indexPath.row]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.cell.rawValue, for: indexPath) as? EmployerTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            cell.setupUI(item: item)
            
            return cell
        }
    }
    
}
