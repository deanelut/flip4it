import SwiftUI



class CflipState: ObservableObject {
   
    @Published var tailsPhoto: UIImage = UIImage(systemName: "camera")!
    @Published var headsPhoto: UIImage  = UIImage(systemName: "camera")!
    @Published var tailsCount = 0
    @Published var headsCount = 0
    @Published var isFlipping = false
    @Published var showFlipMessage = false
    //let var winning = (self.headsCount>self.ftailsCount) ? "heads" : "tails"
    func headsWinner() -> Bool {
        return headsCount > tailsCount
    }
    func tailsWinner() -> Bool {
        return tailsCount > headsCount
    }
    
    init(tailsCount: Int = 0, headsCount: Int = 0, isFlipping: Bool = false) {
        self.tailsCount = tailsCount
        self.headsCount = headsCount
        self.isFlipping = isFlipping
    }


    
}

