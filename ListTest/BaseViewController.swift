//
//  BaseViewController.swift
//  ListTest
//
//  Created by Kanz on 12/11/2019.
//  Copyright © 2019 KanzDevelop. All rights reserved.
//

import SnapKit
import Then
import ReusableKit
import RxSwift
import RxCocoa

class BaseViewController: UIViewController {
    
    var disposeBag = DisposeBag()
    
    lazy private(set) var className: String = {
        return type(of: self).description().components(separatedBy: ".").last ?? ""
    }()
    
    /// There is a bug when trying to go back to previous view controller in a navigation controller
    /// on iOS 11, a scroll view in the previous screen scrolls weirdly. In order to get this fixed,
    /// we have to set the scrollView's `contentInsetAdjustmentBehavior` property to `.never` on
    /// `viewWillAppear()` and set back to the original value on `viewDidAppear()`.
    private var scrollViewOriginalContentInsetAdjustmentBehaviorRawValue: Int?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
    }
    
    deinit {
        log.debug("DEINIT: \(self.className)")
    }
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.addViews()
        self.view.setNeedsUpdateConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // fix iOS 11 scroll view bug
        if #available(iOS 11, *) {
            if let scrollView = self.view.subviews.first as? UIScrollView {
                self.scrollViewOriginalContentInsetAdjustmentBehaviorRawValue =
                    scrollView.contentInsetAdjustmentBehavior.rawValue
                scrollView.contentInsetAdjustmentBehavior = .never
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if #available(iOS 11, *) {
            if let scrollView = self.view.subviews.first as? UIScrollView,
                let rawValue = self.scrollViewOriginalContentInsetAdjustmentBehaviorRawValue,
                let behavior = UIScrollView.ContentInsetAdjustmentBehavior(rawValue: rawValue) {
                scrollView.contentInsetAdjustmentBehavior = behavior
            }
        }
    }
    
    
    // MARK: add Views,Layout Constraints
    private(set) var didSetupConstraints = false
    
    override func updateViewConstraints() {
        if !self.didSetupConstraints {
            self.setupConstraints()
            self.didSetupConstraints = true
        }
        super.updateViewConstraints()
    }
    
    func addViews() {
        
    }
    
    func setupConstraints() {
        // Override point
    }
}



