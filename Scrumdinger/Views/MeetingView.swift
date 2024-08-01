//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Francisco Cordoba on 24/7/24.
//

import SwiftUI
import AVFoundation

struct MeetingView: View {
    @Binding var scrum: DailyScrum
    @StateObject var scrumTimer = ScrumTimer()

    private var player: AVPlayer { AVPlayer.sharedDingPlayer }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.theme.mainColor)
            VStack {
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed, 
                                  secondsRemaining: scrumTimer.secondsRemaining,
                                  theme: scrum.theme)

                Circle()
                    .strokeBorder(lineWidth: 24)
                    .padding()

                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
            }
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: startScrum)
        .onDisappear(perform: endScrum)
    }

    private func startScrum() {
        scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
        scrumTimer.speakerChangedAction = {
            player.seek(to: .zero)
            player.play()
        }
        scrumTimer.startScrum()
    }

    private func endScrum() {
        scrum.history.insert(History(attendees: scrum.attendees), at: 0)
        scrumTimer.stopScrum()
    }
}

#Preview {
    MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
}
