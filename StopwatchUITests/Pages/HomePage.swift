//
//  HomePage.swift
//  StopwatchUITests
//
//  Created by Deepthini Lansakara on 15/03/2022.
//  Copyright © 2022 YiGu. All rights reserved.
//
import XCTest
class HomePage:BasePage {
    
    private lazy var btnStart = button("startBtn")
    private lazy var btnStop = button("stopBtn")
    private lazy var btnLap = button("lapBtn")
    private lazy var btnReset = button("resetBtn")
    private lazy var homeTitle = navBar("Stopwatch")
    private lazy var timerLabel = text("timerLabel")
    private lazy var lapTimerLabel = text("lapTimerLabel")
    private lazy var lapTable = app.tables
    private lazy var lapRow = cell("lapRow")
    
    @discardableResult
    func exists() -> Self {
        XCTAssertTrue(homeTitle.exists)
        XCTAssertTrue(btnStart.waitForExistence(timeout: 3))
        XCTAssertFalse(btnLap.isEnabled)
        XCTAssertTrue(timerLabel.exists)
        XCTAssertTrue(lapTimerLabel.exists)
        return self
    }
    
    @discardableResult
    func startStopWatch() -> Self {
        btnStart.tap()
        return self
    }
    
    @discardableResult
    func verifyStopWatchHasStarted() -> Self {
        XCTAssertTrue(btnStop.exists)
        XCTAssertFalse(btnStart.exists)
        XCTAssertTrue(btnLap.isEnabled)
        checkTimerLabelHasChanged(state: "Start")
        return self
    }
    
    @discardableResult
    func pauseStopWatch() -> Self {
        btnStop.tap()
        return self
    }
    
    @discardableResult
    func resetStopWatch() -> Self {
        btnReset.tap()
        return self
    }
    
    @discardableResult
    func verifyStopWatchHasStopped() -> Self {
        XCTAssertTrue(btnStart.isEnabled)
        XCTAssertTrue(btnReset.isEnabled)
        return self
    }
    
    @discardableResult
    func checkTimerLabelHasChanged(state: String) -> Self {
        let intialTimerStamp = "00:00:00"
        let currentMainTimerStamp = timerLabel.label
        let currentLapTimerStamp = lapTimerLabel.label
        
        if state == "Start" {
            XCTAssertNotEqual(currentMainTimerStamp, intialTimerStamp)
            XCTAssertNotEqual(currentLapTimerStamp, intialTimerStamp)
        }
        else {
            XCTAssertEqual(currentMainTimerStamp, intialTimerStamp)
            XCTAssertEqual(currentLapTimerStamp, intialTimerStamp)
        }
        return self
    }
    
    @discardableResult
    func createLap() -> Self {
        btnLap.tap()
        return self
    }
    
    @discardableResult
    func verifyStopWatchHasReset() -> Self {
        XCTAssertTrue(btnStart.isEnabled)
        XCTAssertFalse(btnLap.isEnabled)
        XCTAssertFalse(btnReset.exists)
        XCTAssertFalse(lapRow.exists)
        checkTimerLabelHasChanged(state: "Reset")
        return self
    }
    
    @discardableResult
    func createMultipleLapsAndVerifyLapsHaveCreated(noOfLaps: Int) -> Self {
        for lapNo in 1...noOfLaps {
            btnLap.tap()
            var idx = lapNo
            validateTheLatestLapCreation(lapIndex: idx)
            idx = idx + 1
        }
        return self
    }
    
    @discardableResult
    func validateTheLatestLapCreation(lapIndex: Int) -> Self {
        var lapPrevTimeStamp = "00:00.00"
        XCTAssertTrue(lapRow.exists)
        let lapLabelName = "Lap" + " " + String(lapIndex)
        XCTAssertTrue(lapRow.staticTexts[lapLabelName].exists)
        let lapCurrentTimeStamp = lapTable.staticTexts.element(boundBy: 1).label
        XCTAssertNotEqual(lapCurrentTimeStamp, lapPrevTimeStamp)
        lapPrevTimeStamp = lapCurrentTimeStamp
        XCTAssertEqual(lapTable.cells.count, lapIndex)
        return self
    }
}
