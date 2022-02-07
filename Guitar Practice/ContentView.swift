//
//  ContentView.swift
//  Guitar Practice
//
//  Created by Karl Stencell on 2020-05-12.
//  Copyright © 2020 Karl Stencell. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var isNavigationBarHidden: Bool = true
    
    @State var current_Key = "C"
    @State var notes = ["C","D","E","F","G","A","B"]
    @State var chordProg = "I-V-vi-IV"
    @State var chords = ["C","G","Am","F"]
    @State var caged_Major_Positions = ["C pos",
                                        "A pos",
                                        "G pos",
                                        "E pos",
                                        "D pos"]
    @State var caged_Minor_Positions = ["Am pos",
                                        "Em pos",
                                        "Dm pos"]
    @State var chordPositions = ["C pos", "G pos", "Am pos", "F pos"]
    
    @State var chordProgs = ["I-V-iv-IV",
                      "V-vi-IV-I",
                      "vi-IV-I-V",
                      "IV-I-V-vi"]
    @State var musicalAlphabet = ["A","Bb","B","C","C#","D","Eb","E","F","F#","G","G#"]
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.gray.opacity(0.2).edgesIgnoringSafeArea(.all)
                VStack(){
                    HStack {
                        Key(current_Key: $current_Key)
                    }
                    .frame(minWidth:0, maxWidth: .infinity, minHeight: 50)
                    .font(.system(size:30, weight: .heavy, design:.default))
                    .minimumScaleFactor(0.3)
                    .lineLimit(1)
                    .background(Rectangle().fill(Color.white).shadow(radius: 5)
                        )
                    .padding(10)
                    Spacer()
                    HStack {
                        Notes(notes: $notes)
                    }
                    .frame(minWidth:0, maxWidth: .infinity, minHeight: 50)
                    .font(.system(size:30, weight: .heavy, design:.default))
                    .minimumScaleFactor(0.3)
                    .lineLimit(1)
                    .background(Rectangle().fill(Color.white).shadow(radius: 5)
                        )
                    .padding(10)
                    Spacer()
                    HStack {
                        ChordProg(chordProg: $chordProg)
                    }
                    .frame(minWidth:0, maxWidth: .infinity, minHeight: 50)
                    .font(.system(size:30, weight: .heavy, design:.default))
                    .minimumScaleFactor(0.3)
                    .lineLimit(1)
                    .background(Rectangle().fill(Color.white).shadow(radius: 5)
                        )
                    .padding(10)
                    Spacer()
                    HStack {
                        Chords(chords: $chords)
                    }
                    .frame(minWidth:0, maxWidth: .infinity, minHeight: 50)
                    .font(.system(size:30, weight: .heavy, design:.default))
                    .minimumScaleFactor(0.3)
                    .lineLimit(1)
                    .background(Rectangle().fill(Color.white).shadow(radius: 5)
                        )
                    .padding(10)
                    Spacer()
                    HStack{
                        ChordPositions(caged_Major_Positions: $caged_Major_Positions, caged_Minor_Positions: $caged_Minor_Positions, chord_Positions: $chordPositions)
                            .font(.system(size:30, weight: .heavy, design:.default))
                            .minimumScaleFactor(0.3)
                            .lineLimit(1)
                            .background(Rectangle().fill(Color.white).shadow(radius: 5)
                            )
                            .padding(10)
                    }
                    HStack{
                        ZStack{
                        buttonView(current_Key: $current_Key, musical_Alphabet: $musicalAlphabet, notes: $notes, chordProg: $chordProg, chordProgs: $chordProgs, chords: $chords, chordPositions: $chordPositions, caged_Major_Positions: $caged_Major_Positions, caged_Minor_Positions: $caged_Minor_Positions)
                            .padding(30)
                            .buttonStyle(GradientButtonStyle())
                            HStack{
                                Spacer()
                                infoButtonView(isNavigationBarHidden: $isNavigationBarHidden)
                            }.padding()
                        }
                    }
                }
            }
            .navigationBarTitle("Back")
            .navigationBarTitle(Text("Back"), displayMode: .inline)
            .navigationBarHidden(self.isNavigationBarHidden)
            .onAppear {
                self.isNavigationBarHidden = true
            }
        }
    }
}

struct infoView: View {
    
    @Binding var isNavigationBarHidden: Bool
    
    var body: some View {
        ZStack{
            ScrollView(.vertical){
                VStack{
                    Group {
                        Text("This app is designed to make you aware of chord positions that sound great together that you might not have thought about before.")
                            .font(.system(size:14, weight: .medium, design:.default))
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding()
                        Text("Practicing these shapes all along the neck will help you learn to improvise as you'll become increasingly aware of where neighbouring chords are to play next!")
                        .font(.system(size:14, weight: .medium, design:.default))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                        Text("The random nature of the key, chord progression, and chord positions has you constantly seeking new root notes on every string which makes practicing boring fretboard memorization sound more musical than ever before!")
                            .font(.system(size:14, weight: .medium, design:.default))
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding()
                        Text("This app randomly cycles through the most common chord progressions comprised of only the I, IV, V, and vi chords of a key so every combination is guaranteed to sound great and you can skip thinking about what you're going to play and get right into practicing!")
                        .font(.system(size:14, weight: .medium, design:.default))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                    }
                    Group {
                        Text("How it works...")
                            .font(.system(size:20, weight: .heavy, design:.default))
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding()
                        Text("These are the 'CAGED' major chord shapes in their open positions. The black dots indicate the root notes.")
                            .font(.system(size:14, weight: .medium, design:.default))
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding()
                        Image("caged-open-major-chords")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 95)
//                            .padding()
                        Text("And these are the minor chords. Only 3 of the CAGED minor positions are commonly played.")
                            .font(.system(size:14, weight: .medium, design:.default))
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding()
                        Image("caged-open-minor-chords")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 95)
                        Text("To play a chord in another position along the fretboard simply mimic an open chord shape and slide it until your root note spots match the chord you want to play. Here are some examples, ")
                            .font(.system(size:14, weight: .medium, design:.default))
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding()
                        Image("caged-examples")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 110)
                    }
                    Group {
                        Text("Some of the CAGED chord shapes can be quite the stretch even for an experienced guitar player so don't be afraid to strum only parts of a chord to make it easier! For example only strum the top 4 strings of the 'G Shape' or only the top 3 strings for the 'D Shape'.")
                        .font(.system(size:14, weight: .medium, design:.default))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                        Text("Use this app to conquer all types of chord shapes and commit them muscle memory so you can execute them at blazing speeds, however some shapes are just harder to play than others and that's okay!")
                        .font(.system(size:14, weight: .medium, design:.default))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                        Text("The most common chord progressions are common for a reason and are valuable to know for both new and experienced musicians but this is not the only way to play!")
                            .font(.system(size:14, weight: .medium, design:.default))
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding()
                        Text("Take a look at the key of C, it gives you lots of practice with the A minor chord but this is also helpful in many other keys. When you're feeling confident with your fancy new chord shapes try to challenge yourself even further! For example, next time you're in the key of G try to incorporate that minor ii chord now that you know where to find it!")
                        .font(.system(size:14, weight: .medium, design:.default))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                        Text("Happy practicing and thanks for downloading!")
                        .font(.system(size:14, weight: .medium, design:.default))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                        Text("- Karl Stencell")
                        .font(.system(size:14, weight: .medium, design:.default))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                    }
                    Group {
                        Text("Additional Tips")
                        .font(.system(size:20, weight: .heavy, design:.default))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                        Text("The CAGED chord shapes come from a larger view of the entire major scale along the fretboard. To keep this beginner friendly lets focus on just the pentatonic major scale.")
                        .font(.system(size:14, weight: .medium, design:.default))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                        Text("Take a look at how they fit together like puzzle pieces. Again, the black dots indicate the root notes.")
                        .font(.system(size:14, weight: .medium, design:.default))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                        Image("caged-major-pentatonic")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        Text("Repeatedly drilling these chord shapes into your mind will help you visualize them while playing and you can use them as markers to keep track of where you are in the grander scheme of the entire scale.")
                        .font(.system(size:14, weight: .medium, design:.default))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                        Text("Think of the scales as the stars and the chord shapes as your constellations to help guide you.")
                        .font(.system(size:14, weight: .medium, design:.default))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                        Text("This will become increasingly familiar with time and you can branch off of these chord shapes and develop your own licks and riffs by playing around in the surrounding scale. Soon it could be a full fledged guitar solo!")
                        .font(.system(size:14, weight: .medium, design:.default))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                        Text("Take it bit by bit and build up the courage to make these chord progressions your own! Maybe next time the app throws an 'E Major' shape (red box) your way try also dancing around in the connecting zones (green boxes) that you're comfortable with to add extra layers to your melody.")
                        .font(.system(size:14, weight: .medium, design:.default))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                        Image("caged-E-example")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                    }
                    Group {
                        Text("And similarily, some ideas for the 'A major' shape.")
                        .font(.system(size:14, weight: .medium, design:.default))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                        Image("caged-A-example")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        Text("The chord progressions provided by this app are meant to be a foundation to viewing the fretboard in its entirety. Come up with your own 'green boxes', play the music you want to play, and never get lost on the neck again!")
                        .font(.system(size:14, weight: .medium, design:.default))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                        Text("Other ideas to try:")
                        .font(.system(size:14, weight: .medium, design:.default))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                        Text("Try playing along with a metronome to really nail those chord change timings.")
                        .font(.system(size:14, weight: .medium, design:.default))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                        Text("Set this up with a friend and have one of you strum the chords while the other tries to play a melody over top. Don't forget to switch!")
                        .font(.system(size:14, weight: .medium, design:.default))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                        
                    }
                }
            }
        }
        .navigationBarTitle(Text("Info"), displayMode: .inline)
        .onAppear {
            self.isNavigationBarHidden = false
        }
    }
}

struct Key: View {
    @Binding var current_Key: String
    
    var body: some View {
        Text("Key of \(current_Key)")
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 70)
    }
}

struct Notes: View {
    @Binding var notes: Array<String>
        
    var body: some View {
        Text("Notes: \(notes.joined(separator: ", "))")
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 70)
    }
}

struct ChordProg: View {
    @Binding var chordProg: String
    
    let chordProgs = ["I-V-iv-IV",
                      "V-vi-IV-I",
                      "vi-IV-I-V",
                      "IV-I-V-vi"]
    
    var body: some View {
        Text("Chord Progression: \(chordProg)")
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 70)
    }
}

struct Chords: View {
    @Binding var chords: Array<String>
    
    var body: some View {
        Text("Chords are: \(chords.joined(separator: ", "))")
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 70)
    }
}

struct ChordPositions: View {
    @Binding var caged_Major_Positions: Array<String>
    @Binding var caged_Minor_Positions: Array<String>
    @Binding var chord_Positions: Array<String>
    
    var body: some View {
       Text("Positions: \(chord_Positions.joined(separator:", "))")
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 70)
    }
}

struct infoButtonView: View {

    @Binding var isNavigationBarHidden: Bool
    var body: some View {
        NavigationLink(destination: infoView(isNavigationBarHidden: $isNavigationBarHidden)) {
            Image("info_icon")
                .renderingMode(.original)
                .clipShape(Circle())
        }
    }
}


struct buttonView: View {
    @Binding var current_Key: String
    @Binding var musical_Alphabet: Array<String>
    @Binding var notes: Array<String>
    @Binding var chordProg: String
    @Binding var chordProgs: Array<String>
    @Binding var chords: Array<String>
    @Binding var chordPositions: Array<String>
    @Binding var caged_Major_Positions: Array<String>
    @Binding var caged_Minor_Positions: Array<String>
    
    var body: some View {
        Button(
            action: {
                self.getNewKey()
                self.getNewNotes()
                self.newChordProg()
                self.newChords()
                self.getCagedPositions()
                
            },
            label: { Text("New Chord Progression") }
        )
    }
    
    func getNewKey(){
        current_Key = musical_Alphabet.randomElement() ?? ""
    }
    func getNewNotes(){
        if current_Key == "A" {
            notes = ["A","B","C#","D","E","F#","G#"]
        }
        if current_Key == "Bb" {
            notes = ["Bb","C","D","Eb","F","G","A"]
        }
        if current_Key == "B" {
            notes = ["B","C#","D","E","F#","G#","A#"]
        }
        if current_Key == "C" {
            notes = ["C","D","E","F","G","A","B"]
        }
        if current_Key == "C#" {
            notes = ["C#/Db","Eb","F","Gb","Ab","Bb","C"]
        }
        if current_Key == "D" {
            notes = ["D","E","F#","G","A","B","C#"]
        }
        if current_Key == "Eb" {
            notes = ["Eb","F","G","Ab","Bb","C","D"]
        }
        if current_Key == "E" {
            notes = ["E","F#","G#","A","B","C#","D#"]
        }
        if current_Key == "F" {
            notes = ["F","G","A","Bb","C","D","E"]
        }
        if current_Key == "F#" {
            notes = ["F#","G#","A#","B","C#","D#","E#"]
        }
        if current_Key == "G" {
            notes = ["G","A","B","C","D","E","F#"]
        }
        if current_Key == "G#" {
            notes = ["G#/Ab","Bb","C","Db","Eb","F","G"]
        }
    }
    func newChordProg() {
        chordProg = chordProgs.randomElement() ?? ""
    }
    func newChords() {
        if chordProg == "I-V-iv-IV" {
            chords = ["\(notes[0])", "\(notes[4])", "\(notes[5])m", "\(notes[3])"]
        }
        if chordProg == "V-vi-IV-I" {
        chords = ["\(notes[4])", "\(notes[5])m", "\(notes[3])", "\(notes[0])"]
        }
        if chordProg == "vi-IV-I-V" {
        chords = ["\(notes[5])m", "\(notes[3])", "\(notes[0])", "\(notes[4])"]
        }
        if chordProg == "IV-I-V-vi" {
            chords = ["\(notes[3])", "\(notes[0])", "\(notes[4])", "\(notes[5])m"]
        }
    }
    func getCagedPositions() {
        chordPositions = []
        for chord in chords {
            if chord.contains("m") {
                chordPositions.append(caged_Minor_Positions.randomElement() ?? "")
            }
            else {
                chordPositions.append(caged_Major_Positions.randomElement() ?? "")
            }

        }
    }
}

struct GradientButtonStyle:ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(15.0)
            .scaleEffect(configuration.isPressed ? 1.0 : 1.1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

