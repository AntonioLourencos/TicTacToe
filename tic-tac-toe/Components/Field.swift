//
//  Field.swift
//  TicTacToe
//
//  Created by Antonio Lourencos on 21/04/23.
//

import SwiftUI

struct Field: View {
	var value: String
	
	var body: some View {
		Text(value)
			.font(.title)
			.frame(width: 80, height: 80)
			.background(.blue)
			.cornerRadius(10)
			.foregroundColor(.white)
			.bold()
	}
}

struct Field_Previews: PreviewProvider {
	static var previews: some View {
		Field(value:"X")
	}
}
