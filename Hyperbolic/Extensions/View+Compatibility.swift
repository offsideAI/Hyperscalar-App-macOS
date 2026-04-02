import SwiftUI

extension View {
    @ViewBuilder
    func hyperbolicFormStyle() -> some View {
        if #available(macOS 13.0, *) {
            self.formStyle(.grouped)
        } else {
            self
        }
    }
}
