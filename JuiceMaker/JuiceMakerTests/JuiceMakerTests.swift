//
//  JuiceMakerTests.swift
//  JuiceMakerTests
//  Created by Kyle& L
//

import XCTest
@testable import JuiceMaker
final class JuiceMakerTests: XCTestCase {
    private var sut: JuiceMaker!
    override func setUpWithError() throws {
        sut = JuiceMaker()
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_딸기재고의_초기값이_10개라_딸기쥬스를_만들수_있는_재고가_없다() {
        
        XCTAssertNoThrow(try sut.makeJuice(juice: .strawberryJuice), "딸기 재고 있음! 테스트 실패")
    }
    
    func test_망고키위쥬스를_만드는데_망고_키위_둘다_재고가_없다() {
        
    }
    
    func test_망고키위쥬스를_만드는데_망고만_재고가_없다() {

    }
    
    func test_망고쥬스를_만들고_남은_망고는_7개다() {
        
    }
    
    func test_파인애플의_재고를_3개로_바꾼다() {
        
    }
}
