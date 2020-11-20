//
//  ContentView.swift
//  Shared
//
//  Created by Felix Akira Green on 11/18/20.
//

import SwiftUI

struct ContentView: View {
	@Namespace var roomies
	@State var selectedRoom: String?
	
	@State var show = true
	
	var body: some View {
		HStack {
			VStack {
				Text("navbar").foregroundColor(.secondary)
			}
			.frame(maxWidth: 50, maxHeight: .infinity)
			
			VStack {
				SpaceCard(show: $show)
				
//				FlowerView()

				ZStack {
					VStack {
						if show {
							RoomCard(title: "Room 1", color: Color.blue)
								.matchedGeometryEffect(id: "room1", in: roomies)
								.frame(maxHeight: 480)
//								.transition(.opacity)
						} else {
							RoomCard(title: "Room 1", color: Color.blue)
								.matchedGeometryEffect(
									id: "room1",
									in: roomies,
									isSource: !show
								)
								.frame(width: 240, height: 135)
		//						.transition(.opacity)
								
						}
					}
					
					
//
				}
				
//				if !show {
					HStack(spacing: 8.0) {
						RoomCard(title: "Room 2", color: Color.blue)
							.frame(maxHeight: 240)
						RoomCard(title: "Room 3", color: Color.blue)
							.frame(maxHeight: 240)
					}
//					.transition(.move(edge: .bottom))
//				}
				Spacer()
			}
			.onTapGesture {
				withAnimation(.spring()) {
					show.toggle()
				}
			}
				
			.frame(maxWidth: .infinity, maxHeight: .infinity)
			.padding([.leading, .bottom, .trailing], 8.0)
			.background(Color.gray.opacity(0.2))
//				.shadow(radius: 10)
			.animation(.spring())
			
			VStack {
				Text("sidebar:people/chat/notifications").foregroundColor(.secondary)
			}
			.frame(maxWidth: 100, maxHeight: .infinity)
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

struct RoomCard: View {
	let title: String
	let color: Color

	var body: some View {
		VStack {
			HStack {
				Text("\(title)")
					.font(.headline)
					.padding(.all, 8.0)
				Spacer()
			}
			.background(color.opacity(0.2))
			Spacer()
			Image(systemName: "photo")
				.font(.title)
			Spacer()
		}
		.foregroundColor(color)
		.background(color.opacity(0.1))
		.animation(.spring())
	}
}

struct SpaceCard: View {
	@Binding var show: Bool
	@State var isCollapsed = false
	
	var body: some View {
		VStack {
			if !show {
				Spacer()
				Image(systemName: "photo")
					.font(.title)
				Spacer()
			}
			HStack(alignment: .firstTextBaseline) {
				if show {
					Image(systemName: "arrow.backward")
				}
				Text("Space")
				Spacer()
			}
			.font(.headline)
			.padding(.all, 8.0)
			.background(Color.purple.opacity(0.2))
			.onTapGesture {
				show.toggle()
			}
			.animation(.spring())
		}
		.foregroundColor(.purple)
		.background(Color.purple.opacity(0.1))
		.frame(maxHeight: show ? .none : 135)
	}
}

struct FlowerView: View {
	 @State private var flowerOut = false

	 var body: some View {
		  ZStack {
				Color.black.edgesIgnoringSafeArea(.all)

				ZStack {
					 ForEach(0..<6) {
						  Circle()
								.foregroundColor(Color(red: 0.6, green: 0.9, blue: 0.8))
								.frame(width: 200, height: 200)
								.offset(x: self.flowerOut ? 100 : 0)
								.rotationEffect(.degrees(Double($0) * 60))
								.blendMode(.hardLight)
					 }
				}
				.rotationEffect(.degrees(flowerOut ? 120 : 0))
				.scaleEffect(flowerOut ? 1 : 0.25)
				.animation(Animation.easeInOut(duration: 4).delay(0.75).repeatForever(autoreverses: true))
				.onAppear() {
					 self.flowerOut.toggle()
				}
		  }
	 }
}
