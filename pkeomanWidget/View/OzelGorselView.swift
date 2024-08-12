//
//  OzelGorselView.swift
//  pkeomanWidget
//
//  Created by Sueda Beyza Özcan on 12.08.2024.
//

import SwiftUI

struct OzelGorselView: View {
    var image : Image
    var body: some View {
        image.resizable().aspectRatio(contentMode: .fit)
    }
}

#Preview {
    OzelGorselView(image: Image("avatar"))
}
