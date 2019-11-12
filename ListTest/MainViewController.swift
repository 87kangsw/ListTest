//
//  MainViewController.swift
//  ListTest
//
//  Created by Kanz on 13/11/2019.
//  Copyright © 2019 KanzDevelop. All rights reserved.
//

import UIKit

import ReactorKit
import RxCocoa
import RxSwift
import Then

class MainViewController: BaseViewController, View {

    typealias Reactor = MainViewReactor
    
    private let refreshButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: nil, action: nil)
    
    private let tableView = UITableView().then {
        $0.backgroundColor = .white
        $0.contentInsetAdjustmentBehavior = .always
    }
    
    init(reactor: MainViewReactor) {
        defer { self.reactor = reactor }
        super.init()
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "List Test"
        self.navigationItem.rightBarButtonItem = refreshButton
    }

    // MARK: UI Setup
    override func addViews() {
        super.addViews()
        self.view.addSubview(tableView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func bind(reactor: Reactor) {
        
    }
}


