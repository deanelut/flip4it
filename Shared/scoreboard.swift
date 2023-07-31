import SwiftUI
import _PhotosUI_SwiftUI



struct scoreboard_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
@available(iOS 16.0, *)

struct ScoreBoard: View {
    @ObservedObject var currFlipState: CflipState
    @State var showSheet01 = false
    @State var showSheet02 = false
    @State private var phase = 0.0

    var body: some View {

        ZStack{
            VStack {
               Spacer()
                    .frame(width:150, height: 50)
                
                HStack{
                    
                    Image("flip4it")
                        .resizable()
                        .frame(width: 450, height: 450)
                        .shadow(color: Color.black, radius: 15, x: 0, y: 0)
                        .rotationEffect(.degrees(-25))
                        .blur(radius: 8)
                 
                    
                }
            }
            
            
            
            //  ZStack {
         
            HStack(alignment: .center) {
                    Spacer()
                  //  .frame(width: 55,height: 150)
               // Spacer()
                HStack {
                    Button {
                        showSheet01.toggle()
                    } label: {
                        Image(uiImage: currFlipState.tailsPhoto)
                            .resizable()
                            .scaledToFit()
                           // .clipShape(Rectangle())
                           // .cornerRadius(25.0)
                            .scaleEffect(1.0 + (CGFloat(currFlipState.tailsCount) / 10))
                            .shadow(color: Color.black, radius: 15, x: 0, y: 0)
                           // .rotationEffect(Angle.degrees(-30.0))
                        
                            .frame(width: 150, height: 150)
//                            .overlay(
//                                    RoundedRectangle(cornerRadius: 16)
//                                        .stroke(.yellow, lineWidth: 4)
//                                )
                            .rotationEffect(Angle.degrees(-30.0))
                        //.border(Color.yellow, width: 15.0)
                        //.clipShape(Circle())
                    }
                    
                } .sheet(isPresented: $showSheet01) {
                    ImagePicker(sourceType: .photoLibrary, selectedImage: $currFlipState.tailsPhoto)
                }
                .shadow(color: .black, radius: 10)
                Image("vs")
                    .resizable()
                    .scaledToFit()
                HStack {
                    Button(action: {
                        showSheet02.toggle()
                        currFlipState.showFlipMessage = true
                    }, label: {
                        Image(uiImage: currFlipState.headsPhoto)
                            .resizable()
                            .scaledToFit()
                            //.clipShape(Rectangle())
                            
                          //  .cornerRadius(25.0)
                            .scaleEffect(1.0 + (CGFloat(currFlipState.headsCount) / 10))
                            .shadow(color: Color.black, radius: 15, x: 0, y: 0)
                           // .rotationEffect(Angle.degrees(30.0))
                        //  .offset(x: -15, y: -50)
                            .frame(width: 150, height: 150)
//                            .overlay(
//                                    RoundedRectangle(cornerRadius: 16)
//                                        .stroke(.yellow, lineWidth: 4)
//                                )
                            .rotationEffect(Angle.degrees(30.0))
                        // .clipShape(Circle())
                        
                    })
                } .sheet(isPresented: $showSheet02) {
                    ImagePicker(sourceType: .photoLibrary, selectedImage: $currFlipState.headsPhoto)
                }
                .shadow(color: .black, radius: 10)
               
                //   }
                
                
                
            }
            
        }
    }//view


}//struct




