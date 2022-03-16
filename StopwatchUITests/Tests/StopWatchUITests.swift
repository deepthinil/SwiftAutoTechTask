//
//  StopWatchUITests.swift
//  StopwatchUITests
//
//  Created by Deepthini Lansakara on 15/03/2022.
//  Copyright © 2022 YiGu. All rights reserved.
//

import XCTest

class StopWatchUITests: BaseTest {
    
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }
    
    override func tearDown() {
    }
    
    /**
     Given I have launch the Stopwatch app
     When I select Start button
     Then I can see StopWatch has started
     When I select Stop button
     Then I can see StopWatch has stopped
     */
    func testStartAndPauseStopWatch() {
        HomePage()
            .exists()
            .startStopWatch()
            .verifyStopWatchHasStarted()
            .pauseStopWatch()
            .verifyStopWatchHasStopped()
    }
    
    /**
     Given I have launch the Stopwatch app
     And I select Start button
     When I create multiple laps
     Then I can see multiple laps have created
     */
    func testCreateMultipleLapsandVerifyLapsHaveCreated() {
        HomePage()
            .exists()
            .startStopWatch()
            .createMultipleLapsAndVerifyLapsHaveCreated(noOfLaps: 3)
    }
    
    /**
     Given I have launch the Stopwatch app
     And I select Start button
     And I create multiple laps
     And I select Stop button
     And I select Start button again
     When I select Lap button
     Then I can see lap creation has started from where it stopped previously
     */
    func testCreateMultipleLapsAndThenStopAndStartLapCreationAgain() {
        HomePage()
            .exists()
            .startStopWatch()
            .createMultipleLapsAndVerifyLapsHaveCreated(noOfLaps: 2)
            .pauseStopWatch()
            .startStopWatch()
            .createLap()
            .validateTheLatestLapCreation(lapIndex: 3)
    }
    
    /**
     Given I have launch the Stopwatch app
     And I select Start button
     And I create multiple laps
     And I select Stop button
     When I select Reset button
     Then I can see Stopwatch has reset
     And I cant see the laps anymore
     */
    func testCreateMultipleLapsAndThenStopAndReset() {
        HomePage()
            .exists()
            .startStopWatch()
            .createMultipleLapsAndVerifyLapsHaveCreated(noOfLaps: 2)
            .pauseStopWatch()
            .resetStopWatch()
            .verifyStopWatchHasReset()
        
    }
    
    /**
     Given I have launch the Stopwatch app
     And I select Start button
     And I select Stop button
     When I select Reset button
     Then I can see Stopwatch has reset
     */
    func testResetStopWatch() {
        HomePage()
            .exists()
            .startStopWatch()
            .pauseStopWatch()
            .resetStopWatch()
            .verifyStopWatchHasReset()
    }
}

