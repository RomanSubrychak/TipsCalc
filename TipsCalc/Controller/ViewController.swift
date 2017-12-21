//
//  ViewController.swift
//  TipsCalc
//
//  Created by Roman Subrychak on 12/17/17.
//  Copyright © 2017 Roman Subrychak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var textField: UITextField!
	
	@IBOutlet weak var tipPercentageLbl: UILabel!
	@IBOutlet weak var tipPercentageSlider: UISlider!
	
	@IBOutlet weak var tipLbl: UILabel!
	@IBOutlet weak var totalLbl: UILabel!
	
	@IBOutlet weak var waysToSplitLbl: UILabel!
	@IBOutlet weak var splitTotalSlider: UISlider!
	@IBOutlet weak var youPayLbl: UILabel!
	
	var tip = TipModel(billAmount: 0.0, tipPercent: 0.0)
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setTipCalculationValues()
		updateUI()
		updateYouPayUI()
	}
	
	func setTipCalculationValues() {
		
		let tipPercent = Double(tipPercentageSlider.value)
		tip.tipPercent = tipPercent
		
		let billAmount = Double(textField.text!) ?? 0
		tip.billAmount = billAmount
		
		tip.calculateTip()
		tip.splitTotal()
		
	}
	
	func updateUI() {
		
		tipLbl.text = String(format: "$%0.2f", tip.tipAmount)
		totalLbl.text = String(format: "$%0.2f", tip.totalAmount)
		tipPercentageLbl.text = "\(Int(tipPercentageSlider.value * 100))%"
	
		updateYouPayUI()
	}
	
	func updateYouPayUI() {
		
		waysToSplitLbl.text = "\(tip.participants)-Way Split:"
		youPayLbl.text = String(format: "$%0.2f", tip.shareToPay)
	}


	@IBAction func billAmounDidChange(_ sender: Any) {
		
		setTipCalculationValues()
		updateUI()
	}
	
	@IBAction func tipPercentageDidChange(_ sender: Any) {
		
		if let slider = sender as? UISlider {
			
			let steps: Float = 100
			let roundedValue = round(slider.value * steps) / steps
			slider.value = roundedValue
			
			setTipCalculationValues()
			updateUI()
		}
		
	}
	@IBAction func splitTotalDidChange(_ sender: Any) {
		
		if let slider = sender as? UISlider {
			
			let participants = Int(slider.value)
			tip.participants = participants
			
			tip.splitTotal()
			updateYouPayUI()
		}
	}
}

