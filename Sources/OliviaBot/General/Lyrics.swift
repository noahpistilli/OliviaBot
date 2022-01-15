//
//  Lyrics.swift
//  
//
//  Created by Noah Pistilli on 2022-01-14.
//

#if os(Linux)
import FoundationNetworking
#endif

import Foundation
import SwiftSoup
import Sword

struct Lyrics {
    func getLyrics(event: SlashCommandEvent) {
        let name = event.getOptionAsString(optionName: "name")!
        // This can take a while, set ephemeral
        var event = event
        event.deferReply()
        
        let embed = parseLyrics(name: name)
        
        event.replyEmbeds(embeds: embed)
    }
    
    func parseLyrics(name: String) -> EmbedBuilder {
        // Replace spaces with %20
        let song = name.replacingOccurrences(of: " ", with: "%20")
        var url = URL(string: "https://search.azlyrics.com/search.php?q=\(song)")!
        
        do {
            let html = try String(contentsOf: url)
            var doc = try SwiftSoup.parse(html)
            let table = try doc.select("table.table").first()
            
            guard let table = table else {
                return EmbedBuilder().setTitle(title: "The requested song does not exist.")
            }

            let songURL = try table.select("a").attr("href")
           
            // Now that we have the actual URL for the song lyrics, we will get the lyrics
            url = URL(string: songURL)!
            
            let lyricsHTML = try String(contentsOf: url)
            doc = try SwiftSoup.parse(lyricsHTML)
            let div = try doc.select("div.col-lg-8").first()!
            let title = try div.select("b").get(1)
            let lyricsText = try div.select("div").get(6)
            
            let authorDiv = try div.select("div.lyricsh").first()!
            var author = try authorDiv.select("b").first()!.text()
            author = author.replacingOccurrences(of: "Lyrics", with: "")
            
            var lyrics = try SwiftSoup.clean(SwiftSoup.clean(try! lyricsText.html(), Whitelist.none().addTags("br", "p"))!, "",  Whitelist.none(), OutputSettings().prettyPrint(pretty: false))!
            
            // An embed description can have a max of 2000 characters
            if lyrics.count > 2000 {
                let embedMax = lyrics.index(lyrics.startIndex, offsetBy: 2000)
                lyrics = String(lyrics[..<embedMax])
                
                // Make the trimmed lyrics clean
                lyrics = String(lyrics[..<lyrics.lastIndex(of: "\n")!])
            }
            
            let embed = EmbedBuilder()
                .setDescription(description: lyrics)
                .setTitle(title: try title.text())
                .setFooter(text: "Artist: \(author)")

            return embed
        } catch {
            return EmbedBuilder().setTitle(title: "The requested song does not exist.")
        }
    }
}
