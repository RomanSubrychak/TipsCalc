//
//  TipModel.swift
//  TipsCalc
//
//  Created by Roman Subrychak on 12/19/17.
//  Copyright © 2017 Roman Subrychak. All rights reserved.
//

import Foundation

struct TipModel {
	
	var billAmount = 0.0
	var tipPercent = 0.0
	
	private(set) var tipAmount = 0.0
	private(set) var totalAmount = 0.0
	
	init(billAmount: Double, tipPercent: Double) {
		self.billAmount = billAmount
		self.tipAmount = tipPercent
	}
	
	mutating func calculateTip() {
		tipAmount = billAmount * tipPercent
		totalAmount = billAmount + tipAmount
	}
}

