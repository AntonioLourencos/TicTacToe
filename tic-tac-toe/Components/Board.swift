//
//  Board.swift
//  TicTacToe
//
//  Created by Antonio Lourencos on 21/04/23.
//

import SwiftUI

struct Board: View {
	var game: [[String]]
	var handleClick: (Int, Int) -> Void
	
	var body: some View {
		VStack {
			ForEach(game.indices, id: \.self) { row in
				HStack(alignment: VerticalAlignment.center) {
					ForEach(game[row].indices, id: \.self) { column in
						Field(value: game[row][column]).onTapGesture {
							handleClick(row, column)
						}
					}
				}
			}
		}
	}
}

struct Board_Previews: PreviewProvider {
	static var previews: some View {
		Board(
			game: Array(
				repeating:
					Array(
						repeating: "O",
						count: 3
					),
				count: 3),
			handleClick: { _, _ in })
	}
}
