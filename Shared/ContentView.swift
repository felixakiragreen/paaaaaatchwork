//
//  ContentView.swift
//  Shared
//
//  Created by Felix Akira Green on 11/18/20.
//

import SwiftUI

struct ContentView: View {
	@Namespace var roomies
	@State var selectedRoom: Room?
//		= rooms[0]
  
	var body: some View {
		let columns = [
			GridItem(), GridItem()
		]
	  
		HStack {
			LeftNavBar()
		  
			VStack(spacing: 8) {
				SpaceCard(selectedRoom: $selectedRoom)
			  
				// FlowerView()
			  
				// do I need whole isSource thnig?
			  
				if let room = selectedRoom {
					RoomCard(room: room, selectedRoom: selectedRoom)
						.matchedGeometryEffect(id: room.id, in: roomies)
						.aspectRatio(16 / 9, contentMode: .fill)
						.padding(.horizontal, 8)
					// .transition(.opacity)
				}
		  
				ScrollView(.vertical) {
					LazyVGrid(columns: columns, spacing: 8) {
						if selectedRoom == nil {
							ForEach(rooms) { room in
								if selectedRoom?.id != room.id {
									RoomCard(room: room, selectedRoom: selectedRoom)
										.matchedGeometryEffect(
											id: room.id,
											in: roomies
//									,isSource: !show
										)
										.aspectRatio(16 / 9, contentMode: .fill)
										.onTapGesture {
											withAnimation(.spring()) {
												if selectedRoom == nil {
													selectedRoom = room
												}
											}
										}
								}
							}
						} else {
							ForEach(subRooms) { room in
								RoomCard(room: room, selectedRoom: selectedRoom)
									.aspectRatio(16 / 9, contentMode: .fill)
							}
						}
					}
				}
				.padding(.horizontal, 8)
//				.frame(maxWidth: .infinity, minHeight: .infinity)
			  
//				if !show {
//					HStack(spacing: 8.0) {
//						RoomCard(title: "Room 2", color: Color.blue)
//							.frame(maxHeight: 240)
//						RoomCard(title: "Room 3", color: Color.blue)
//							.frame(maxHeight: 240)
//					}
//					.transition(.move(edge: .bottom))
//				}
//				Spacer()
			}
			.background(Color.gray.opacity(0.2))
			.frame(maxWidth: .infinity, maxHeight: .infinity)

//			.onTapGesture {
//				withAnimation(.spring()) {
//					show.toggle()
//				}
//			}
		  
//			.padding([.leading, .bottom, .trailing], 8.0)
		  
//				.shadow(radius: 10)
//			.animation(.spring())
		  
			RightSideBar()
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
