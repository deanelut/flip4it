//
//  ContentView.swift
//  Shared
//
//  Created by Scott Luttermoser on 2/11/22.
//

import SwiftUI



struct ContentView: View {

    @StateObject var flipinState = CflipState()
    // @State var isFlipping = false
    @State var isHeads = false
    @State var isStart = true
    @State var degreesToFlip: Int = 0
    @State var tailsCount: Int = 0
    @State var headsCount: Int = 0
    @State var isShowPhotoLibrary = false
    @State private var angle: Double = 45
    @State private var transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
    @State private var animationChange = 1.0
    @State private var scaleAmount = 1.0
    @State private var scaleAmount2 = 0.5

    func flipCoin() {

        withAnimation {
            let randomNumber = Int.random(in: 5...16)
            if degreesToFlip > 1800000000 {
             //   reset()
            }
            degreesToFlip = degreesToFlip + (randomNumber * 180)
            headsOrTails()
            flipinState.isFlipping.toggle()
        }

        withAnimation(.linear(duration: 3)) {

            scaleAmount = 0.5
            scaleAmount2 = 1.0
        }
    }

    func headsOrTails() {
        let divisible = degreesToFlip / 360
        (divisible % 2) == 0 ? (isHeads = false) : (isHeads = true)
        isHeads == true ? (flipinState.headsCount += 1) : (flipinState.tailsCount += 1)
    }

    func reset() {
        flipinState.tailsCount = 0
        flipinState.headsCount = 0
        scaleAmount = 1.0
        scaleAmount2 = 0.5
    }

    @State private var animate = false
    @State var isSplashActive: Bool = true
    @State var showCoin: Bool = true//hardcoded removed this
    let coinFlipText: Color = .black
    var body: some View {

        HStack {
            VStack {
                ScoreBoard(currFlipState: flipinState)
                if showCoin {
                    
                    ZStack {
                        
                        if (flipinState.showFlipMessage) {
                            Image("press_to_flip")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 220, height: 150)
                            // .zIndex(1)
                                .offset(y:-125)
                                .colorMultiply(coinFlipText)
                            // }
                             Spacer()
                            Coin(isHeads: $isHeads, flippinState: flipinState)
                                .rotation3DEffect(Angle(degrees: (Double(degreesToFlip))), axis: (x: CGFloat(0), y: CGFloat(20), z: CGFloat(0)))
                                .scaleEffect(flipinState.isFlipping ? scaleAmount:scaleAmount2)
                                .onTapGesture {
                                    //  if (!flipinState.isFlipping){ //not working always isflipping?

                                    flipCoin()
                                    // }


                                }
                        }
//
//                        Button(action: {
//                            reset()
//                        }, label: {
//                            HStack {
//
//                                Spacer()
//                                Spacer()
//                                VStack {
//                                    Image("reset")
//                                        .resizable()
//                                        .frame(width: 75.0, height: 75.0)
//                                    //.scaleEffect(1.5)
//                                        .animation(.spring(), value: 1)
//                                        .padding()
//                                        .shadow(color: .black, radius: 10, x: 0, y: 0)
//                                   // Spacer()
//                                    Spacer()
//
//                                }
//
//                            }
//
//                            })
                        Spacer()
                    }
                }
               

            }
          //  .frame(maxWidth: .infinity, maxHeight: .infinity)
            //.accentColor(Color.black)
            .background(Color.blue)
            

            //.background(
            //  Image("background")
            //.resizable()
            // .scaledToFit()

            //   .blur(radius: 5.5))
            // .aspectRatio(contentMode: .fill)
            // .frame(width: geo.size.width * 0.8)
            //   .frame(width: geo.size.width, height: geo.size.height)
        }
            .onAppear() {
            showCoin = true
        }
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}

struct Coin: View {
    @Binding var isHeads: Bool
    var flippinState: CflipState

    var body: some View {

        // ZStack {
        //Spacer()
        ZStack {
            // Spacer()
            if flippinState.headsPhoto == UIImage(systemName: "camera") {
                Image("coin_flip_icon")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 332.0, height: 332.0)
                    .shadow(color: .yellow, radius: 70, x: 0, y: 0)
            } else {
                
                if isHeads {
                    Image(uiImage: flippinState.tailsPhoto)
                        .resizable()
                        .clipShape(Circle())
                        .scaledToFit()
                        .frame(width: 332.0, height: 332.0)
                        .shadow(color: .black, radius: 50, x: 0, y: 0)
                } else {
                    Image(uiImage: flippinState.headsPhoto)
                        .resizable()
                        .clipShape(Circle())
                        .scaledToFit()
                    
                        .frame(width: 332.0, height: 332.0)
                        .shadow(color: .black, radius: 50, x: 0, y: 0)
                }
            }
        }

       

        //}

    }
}
