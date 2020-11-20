//
//  PeripheralViews.swift
//  Paaaaaatchwork
//
//  Created by Felix Akira Green on 11/19/20.
//

import SwiftUI

struct LeftNavBar: View {
	var body: some View {
		VStack {
			Text("navbar").foregroundColor(.secondary)
		}
		.frame(maxWidth: 50, maxHeight: .infinity)
	}
}

struct RightSideBar: View {
	var body: some View {
		VStack {
			Text("sidebar:people/chat/notifications").foregroundColor(.secondary)
		}
		.frame(maxWidth: 100, maxHeight: .infinity)
	}
}

struct Peripheral_Previews: PreviewProvider {
	static var previews: some View {
		LeftNavBar()
		RightSideBar()
	}
}
