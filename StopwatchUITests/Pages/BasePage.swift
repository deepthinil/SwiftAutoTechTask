//
//  BasePage.swift
//  StopwatchUITests
//
//  Created by Deepthini Lansakara on 15/03/2022.
//  Copyright © 2022 YiGu. All rights reserved.
//

import XCTest

class BasePage {
    
    public let app = XCUIApplication()
    
    //Button
    func button(_ name: String) -> XCUIElement {
        return app.buttons[name]
    }
    
    //Navigation Bar
    func navBar(_ name: String) -> XCUIElement {
        return app.navigationBars[name]
    }
    
    //Text
    func text(_ name: String) -> XCUIElement {
        return app.staticTexts[name]
    }
    
    //Table cell
    func cell(_ name: String) -> XCUIElement {
        return app.tables.cells[name]
    }
    
}
