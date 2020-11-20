 //
//  Model.swift
//  Paaaaaatchwork
//
//  Created by Felix Akira Green on 11/19/20.
//

import SwiftUI

struct Room: Identifiable, Equatable {
	var id = UUID()
	var title: String
	var color: Color
	// TODO: add content
}

var rooms: [Room] = [
	Room(title: "Room 1", color: .blue),
	Room(title: "Room 2", color: .blue),
	Room(title: "Room 3", color: .blue),
	Room(title: "Room 4", color: .blue),
	Room(title: "Room 5", color: .blue),
	Room(title: "Room 6", color: .blue),
	Room(title: "Room 7", color: .blue),
]

var subRooms: [Room] = [
	Room(title: "Submodule 1", color: .green),
	Room(title: "Submodule 2", color: .green),
	Room(title: "Submodule 3", color: .green),
]
