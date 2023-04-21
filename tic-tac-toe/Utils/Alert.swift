//
//  Alert.swift
//  tic-tac-toe
//
//  Created by Antonio Lourencos on 21/04/23.
//

struct AlertInfo: Identifiable {
	enum AlertType {
		case winner
		case draw
	}
	
	let id: AlertType
	let title: String
	let message: String
}
