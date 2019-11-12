//
//  List.swift
//  ListTest
//
//  Created by Kanz on 13/11/2019.
//  Copyright © 2019 KanzDevelop. All rights reserved.
//

import Foundation

struct List<Element: ModelType> {
    var items: [Element]
    var nextPage: String?
    
    init(items: [Element], nextPage: String?) {
        self.items = items
        self.nextPage = nextPage
    }
}
