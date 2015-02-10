//
//  TypeScaler.swift
//  Type Scaler
//
//  Created by Allen Xavier on 1/31/15.
//  Copyright (c) 2015 Allen Garvey. All rights reserved.
//

import Foundation

class TypeScaler : NSObject{
	let TYPE_RATIOS  : [String : Double] = [
		"minor second" : 1.067,
		"major second" : 1.125,
		"minor third" : 1.2,
		"major third" : 1.25,
		"perfect fourth" : 1.333,
		"augmented fourth" : 1.414,
		"perfect fifth" : 1.5,
		"golden ratio" : 1.618
	];
	let SCALE_VALUE_CHOICES : [String] = ["sp","em"];
	let EM_VALUE : Double = 1;
	var baseValueInPixels : Double = 16;
	var scaleValueChoice : String = "sp";
	var typeScaleName : String = "major third";


	func calculateScale(input:Double, ratio:Double, power:Double)->Double{
		return input * pow(ratio, power);
	}
	
	func calculationString()->String{
		let ratio : Double = TYPE_RATIOS[typeScaleName] ?? TYPE_RATIOS["major third"]!;
		var calculationString = "Base value: \(baseValueInPixels)\nType scale: \(typeScaleName)\n\n";
		
		for power in stride(from: 4, to: -4, by: -1){
			let pixelValue = calculateScale(baseValueInPixels, ratio: ratio, power: Double(power));
			let emValue = calculateScale(EM_VALUE, ratio: ratio, power: Double(power));
			let printValue : Double = scaleValueChoice == "sp" ? pixelValue : emValue;
			calculationString = calculationString + "\(round(printValue * 1000) / 1000)\(scaleValueChoice)\n";
		}
		return calculationString;
	}

}