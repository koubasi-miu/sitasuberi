//
//  File.swift
//  sitasuberi
//
//  Created by 藤井美羽 on 2022/03/04.
//

import AVFoundation

class AudioRecorder {
    
    private var audioRecorder: AVAudioRecorder!
    internal var audioPlayer: AVAudioPlayer!
    
    internal func record(a: String) {
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category.playAndRecord)
        try! session.setActive(true)
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 44100,
            AVNumberOfChannelsKey: 2,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        audioRecorder = try! AVAudioRecorder(url: getURL(b: a), settings: settings)
        audioRecorder.record()
    }
    
    internal func recordStop(a: String) -> Data?{
        audioRecorder.stop()
        let data   = try? Data(contentsOf: getURL(b: a))
        return data
    }
    
    internal func play(a: String) {
        audioPlayer = try! AVAudioPlayer(contentsOf: getURL(b: a))
        audioPlayer.volume = 10.0
        audioPlayer.play()
    }
    
    internal func playStop() {
        audioPlayer.stop()
    }
    
    private func getURL(b: String) -> URL{
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(b+".m4a")
    }
}

