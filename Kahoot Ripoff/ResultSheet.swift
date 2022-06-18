import SwiftUI

struct ResultSheet: View {
    var s: Int
    var body: some View {
        VStack {
            Text("*__SCORE: \(s)/4__*")
            if s == 4 {
                Text("Good Job You know basic paw patrol, now watch more")
                    .multilineTextAlignment(.center)
            } else if s > 2 {
                Text("You did Alright")
            } else if s < 3 {
                Text("You should watch more paw patrol")
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView(s: 4)
        
    }
}
