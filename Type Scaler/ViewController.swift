//
//  ViewController.swift
//  Type Scaler
//
//  Created by Allen Xavier on 1/31/15.
//  Copyright (c) 2015 Allen Garvey. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
	
	@IBOutlet weak var basePixelValueTextField: NSTextField!

	@IBOutlet weak var outputUnitsPopUp: NSPopUpButton!
	@IBOutlet weak var typeScalePopUp: NSPopUpButtonCell!
	@IBOutlet var calculationResultsTextView: NSTextView!

	let typeScaler = TypeScaler();
	let defaultTypeSize : Double = 16;
	let outputUnitChoices = ["sp", "em"];
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		basePixelValueTextField.stringValue = "\(defaultTypeSize)";
		outputUnitsPopUp.addItemsWithTitles(outputUnitChoices);
		typeScalePopUp.addItemsWithTitles(typeScaler.typeScaleNames);
		typeScalePopUp.selectItem(typeScalePopUp.itemAtIndex(3)); //select Major Third by default
	}

	override var representedObject: AnyObject? {
		didSet {
		// Update the view, if already loaded.
		}
	}

	@IBAction func displayCalculations(sender: AnyObject) {
		let outputUnits : String = outputUnitsPopUp.selectedItem!.title;
		let typeScaleName : String = typeScalePopUp.selectedItem!.title;
		let baseValueInPts : Double = (basePixelValueTextField.stringValue as NSString).doubleValue;
		let baseValue : Double = outputUnits.lowercaseString == "em" ? typeScaler.emValue : baseValueInPts;
		var calculationString = "Base value: \(baseValueInPts)\nType scale: \(typeScaleName)\n\n";
		
		for calculatedValue : Double in typeScaler.calculatedScaleArray(baseValue, typeRatioName: typeScaleName, rangeStart: -3, rangeEnd: 5){
			calculationString = calculationString + "\(round(calculatedValue * 1000) / 1000)\(outputUnits)\n";
		}
	
		
		calculationResultsTextView.string = calculationString;
		calculationResultsTextView.textStorage!.font = NSFont.userFontOfSize(16.0);
	}

}

