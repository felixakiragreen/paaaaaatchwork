//
//  Cards.swift
//  Paaaaaatchwork
//
//  Created by Felix Akira Green on 11/19/20.
//

import SwiftUI

struct RoomCard: View {
	let room: Room
	let selectedRoom: Room?
	
	@State var isHovering = false

	var body: some View {
		VStack {
			HStack {
				Text("\(room.title)")
					.font(.headline)
					.padding(.all, 8.0)
					.foregroundColor(isHovering ? .primary : room.color)
				Spacer()
			}
			.background(room.color.opacity(0.2))
//			if selectedRoom == nil || selectedRoom?.id == room.id {
				Spacer()
				Image(systemName: "photo")
					.font(.title)
					.transition(.opacity)
				Spacer()
//			}
		}
		.foregroundColor(room.color)
		.background(room.color.opacity(isHovering ? 0.5 : 0.1))
		.onHover { over in
			withAnimation(.spring()) {
				isHovering = over
			}
		}
	}
}

struct SpaceCard: View {
	@Binding var selectedRoom: Room?
	@State var isHovering = false

	var body: some View {
		VStack {
			if selectedRoom == nil {
				Spacer()
				Image(systemName: "photo")
					.font(.title)
				Spacer()
			}
			HStack(alignment: .firstTextBaseline) {
				if selectedRoom != nil {
					Image(systemName: "arrow.backward")
				}
				Text("Space")
				Spacer()
			}
			.font(.headline)
			.padding(.all, 8.0)
			.background(Color.purple.opacity(0.2))
			.onTapGesture {
				withAnimation {
					if selectedRoom != nil {
						selectedRoom = nil
						isHovering = false
					}
				}
			}
		}
		.foregroundColor(isHovering ? .primary : .purple)
		.background(Color.purple.opacity(isHovering ? 0.5 : 0.1))
		.frame(maxHeight: selectedRoom == nil ? 135 : .none)
		.padding(.horizontal, selectedRoom == nil ? 8 : 0)
		.onHover { over in
			withAnimation(.spring()) {
				if selectedRoom != nil {
					isHovering = over
				}
			}
		}
	}
}

struct FlowerView: View {
	@State private var flowerOut = false

	var body: some View {
		ZStack {
			Color.black.edgesIgnoringSafeArea(.all)

			ZStack {
				ForEach(0 ..< 6) {
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
			.onAppear {
				self.flowerOut.toggle()
			}
		}
	}
}

struct Cards_Previews: PreviewProvider {
	static var previews: some View {
		RoomCard(room: Room(title: "Preview", color: .red), selectedRoom: nil)
		SpaceCard(selectedRoom: .constant(nil))
	}
}
