import SwiftUI
 
struct ContentView: View {
    @State var progress: Double = 1
        
    let questions = [
        Question(question: "Which PAW Patrol pup is the youngest?", ans: 1, a1: "Zuma", a2: "Chase", a3: "Ryder", a4: "Mayor Goodway"),
        Question(question: "How do the Pups know when Ryder is calling them to the Lookout for a mission?", ans: 1, a1: "Their Pup Tags glow!", a2: "When they get hungry…", a3: "Instinct", a4: "When they get HaRd"),
        Question(question: "What is Chase allergic to?", ans: 2, a1: "YJ Soon™", a2: "Cats and feathers" , a3: "Alpha Male Doggies", a4: "Oxygen"),
        Question(question: "Where do the Pups gather to get their mission from Ryder?", ans: 3, a1: "The Overhang", a2: "Innovis", a3: "The Lookout", a4: "Ryder’s House")
    ]
    
    @State var wrongAlertShown = false
    @State var rightAlertShown = false
    @State var questionIndex = 0
    @State var score = 0
    @State var isSheetShown = false
    
    var body: some View {
        VStack {
            
            Text("Score: \(score)")
                .font(.title2)
            
            Text("__Question \(questionIndex + 1)/4__")
                .padding()
                .font(.title)
            
            
            Text(questions[questionIndex].question)
                .multilineTextAlignment(.center)
            HStack {
                VStack {
                
                    Button {
                        if questionIndex == 0 {
                            score = 0
                        }
                        if questions[questionIndex].ans == 1 {
                            rightAlertShown = true
                        } else {
                            wrongAlertShown = true
                        }
                    } label: {
                        Text("▲ \(questions[questionIndex].a1)")
                            .foregroundColor(.white)
                            .padding()
                            .background(.red)
                            .cornerRadius(20)
                    }
                    
                    Button {
                        if questionIndex == 0 {
                            score = 0
                        }
                        if questions[questionIndex].ans == 3 {
                            rightAlertShown = true
                        } else {
                            wrongAlertShown = true
                        }
                        
                    } label: {
                        Text("◆ \(questions[questionIndex].a3)")
                            .foregroundColor(.white)
                            .padding()
                            .background(.yellow)
                            .cornerRadius(20)
                            
                    }

                }
                VStack {
                    Button {
                        if questionIndex == 0 {
                            score = 0
                        }
                        if questions[questionIndex].ans == 2 {
                            rightAlertShown = true
                        } else {
                            wrongAlertShown = true
                        }
                    } label: {
                        Text("⚪️ \(questions[questionIndex].a2)")
                            .foregroundColor(.white)
                            .padding()
                            .background(.blue)
                            .cornerRadius(20)
                    }
                    Button {
                        if questionIndex == 0 {
                            score = 0
                        }
                        if questions[questionIndex].ans == 4 {
                            rightAlertShown = true
                        } else {
                            wrongAlertShown = true
                        }
                    } label: {
                        Text("▫️ \(questions[questionIndex].a4)")
                            .foregroundColor(.white)
                            .padding()
                            .background(.green)
                            .cornerRadius(20)
                    }
                }
            }
        
            .sheet(isPresented: $isSheetShown) {
                ResultSheet(s: score)
            }
            .alert("__Wrong!!! *OUTRAGEOUS* How could you get such a simple question wrong!??!!?!?!__", isPresented: $wrongAlertShown) {
                Button(role: .none) {
                    if questionIndex == 3 {
                        isSheetShown = true
                        questionIndex = 0
                    } else {
                        questionIndex += 1
                    }
                } label: {
                    Text("Next Question")
                }
            }
            .alert("__Correct!!! You are not bad at this__", isPresented: $rightAlertShown) {
                Button(role: .none) {
                    score += 1
                    if questionIndex == 3 {
                        isSheetShown = true
                        questionIndex = 0
                    } else {
                        questionIndex += 1
                    }
                } label: {
                    Text("Next Question")
                }
            }
        }
    }
}

        


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
