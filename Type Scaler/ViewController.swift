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
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		basePixelValueTextField.stringValue = "\(typeScaler.baseValueInPixels)";
		outputUnitsPopUp.addItemsWithTitles(typeScaler.SCALE_VALUE_CHOICES);
		typeScalePopUp.addItemsWithTitles(Array(typeScaler.TYPE_RATIOS.keys));
	}

	override var representedObject: AnyObject? {
		didSet {
		// Update the view, if already loaded.
		}
	}

	@IBAction func displayCalculations(sender: AnyObject) {
		typeScaler.scaleValueChoice = outputUnitsPopUp.selectedItem!.title;
		typeScaler.typeScaleName = typeScalePopUp.selectedItem!.title;
		typeScaler.baseValueInPixels = (basePixelValueTextField.stringValue as NSString).doubleValue;
		calculationResultsTextView.string = typeScaler.calculationString();
		calculationResultsTextView.textStorage!.font = NSFont.userFontOfSize(16.0);
	}

}

