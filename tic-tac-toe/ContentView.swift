//
//  ContentView.swift
//  TicTacToe
//
//  Created by Antonio Lourencos on 21/04/23.
//

import SwiftUI

struct ContentView: View {
	@State private var info: AlertInfo?
	@State var showAlert: Bool = false
	
	@State var currentPlayer: String = "X"
	@State var GameBoard: [[String]] = Array(
		repeating: Array(repeating: "", count: 3),
		count: 3
	)
	
	var body: some View {
		VStack {
			Text("Tic Tac Toe").font(.largeTitle).bold()
			
			HStack {
				Text("Now is your time: ").font(.title2)
				Text("\(currentPlayer)").font(.title)
			}
			
			Board(game: GameBoard, handleClick: handleClick)
				.padding()
				.alert(isPresented: $showAlert) {
					Alert(
						title: Text(info!.title),
						message: Text(info!.message),
						dismissButton: .default(
							Text("Reset Game"),
							action: {
								ResetGame()
							}
						)
					)
				}
		}
	}
	
	func ResetGame() {
		if(info?.id == .draw){
			currentPlayer = currentPlayer == "X" ? "O" : "X"
		}
		
		GameBoard = Array(
			repeating: Array(repeating: "", count: 3),
			count: 3
		)
	}
	
	func checkWinner() -> Bool {
		// Here we have a list that contains the current positions that we can win and then I check each one to find if is "X" or "O"
		
		// GameBoard works
		// first param = angle x
		// second param = angle y
		
		var posibleWins = [
			[GameBoard[0][0], GameBoard[0][1], GameBoard[0][2]],
			[GameBoard[1][0], GameBoard[1][1], GameBoard[1][2]],
			[GameBoard[2][0], GameBoard[2][1], GameBoard[2][2]],
			
			[GameBoard[0][0], GameBoard[1][0], GameBoard[2][0]],
			[GameBoard[0][1], GameBoard[1][1], GameBoard[2][1]],
			[GameBoard[0][2], GameBoard[1][2], GameBoard[2][2]],
			
			[GameBoard[0][0], GameBoard[1][1], GameBoard[2][2]],
			[GameBoard[2][0], GameBoard[1][1], GameBoard[0][2]],
		]
		
		// We cannot use the method with an operator "||" because if we have some situation like this, x o x our system will identify that we have a winner but isn't a true information
		for possibleWin in posibleWins {
			if possibleWin.allSatisfy({ $0 == "X" }) { return true }
			
			if possibleWin.allSatisfy({ $0 == "O" }) { return true }
		}
		
		return false
	}
	
	func checkDraw() -> Bool {
		let isDraw = GameBoard.allSatisfy { row in row.allSatisfy { !$0.isEmpty } }
		
		if isDraw { return true }
		
		return false
	}
	
	func handleClick(x: Int, y: Int) {
		if !GameBoard[x][y].isEmpty {
			return
		}
		
		GameBoard[x][y] = currentPlayer
		
		let ExistsWinner: Bool = checkWinner()
		
		if ExistsWinner {
			info = AlertInfo(
				id: .winner,
				title: "We have a new Champion 💥",
				message: "Congratulations"
			)
			
			showAlert = true
			
			return
		}
		
		let isDraw: Bool = checkDraw()
		
		if isDraw {
			info = AlertInfo(
				id: .draw,
				title: "Ah draw",
				message: "Why you don't won?"
			)
			
			showAlert = true
			
			return
		}
		
		if currentPlayer == "X" {
			currentPlayer = "O"
			return
		}
		
		currentPlayer = "X"
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
