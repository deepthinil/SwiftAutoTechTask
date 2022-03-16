//
//  BaseTest.swift
//  StopwatchUITests
//
//  Created by Deepthini Lansakara on 15/03/2022.
//  Copyright © 2022 YiGu. All rights reserved.
//


import XCTest

class BaseTest: XCTestCase {
    
    
    private var baseScreen = BasePage()
    
    lazy var app = baseScreen.app
    
    open override func setUp() {
        continueAfterFailure = false
        app.launch()
    }
    
    open override func tearDown() {
        let screenshot = XCUIScreen.main.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.lifetime = .deleteOnSuccess
        add(attachment)
        app.terminate()
    }
}

